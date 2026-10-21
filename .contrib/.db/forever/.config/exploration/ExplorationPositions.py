"""
ExplorationPositions: estimate missing ExplorationAreaPositionDB coordinates from DB2 data.

For every area that has a WorldMapOverlay (i.e. the game reveals a piece of the
map when the area is discovered), the centre of that overlay's hit rectangle is a
good "go here to explore it" point on the map.

    AreaTable          -> each area's parent chain, up to its zone
    UiMapAssignment    -> zone AreaID -> zone UiMapID
    UiMap              -> map names / types
    WorldMapOverlay    -> overlay pieces per AreaID, per map art, in canvas pixels

Each map art (UiMapArtID) is assigned to the UiMap that most of its overlay areas
belong to, and an area gets a position on every map whose art carries one of its
overlay pieces (e.g. a city area shown on its surrounding zone map). Many maps have
two arts with overlays for the same areas; they usually agree, and when they don't
the art that best matches that map's harvested points is used, otherwise the newest.
Disagreements are listed in the report.

Positions already present in the existing ExplorationAreaPositionDB export (real,
in-game harvested points) are never replaced; they are only used to measure how
accurate the estimates are.

Output (next to this script in .db/forever/.config/exploration, for review -- the
exported ExplorationAreaPositionDB.lua is never overwritten):
    ExplorationPositions.lua         estimated positions in ExplorationAreaPositionDB format
    ExplorationPositions_Report.txt  accuracy against harvested points, art conflicts, skipped areas

Usage:
    python ExplorationPositions.py [--wago DIR] [--export FILE] [--out DIR]
Defaults point at the Forever database (.wago CSVs one folder up, export alongside).
"""
import argparse
import csv
import glob
import math
import os
import re
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_WAGO = os.path.join(HERE, "..", ".wago")   # .db/forever/.config/.wago
DEFAULT_EXPORT = os.path.join(HERE, "ExplorationAreaPositionDB.lua")

# Classic map canvas size (UiMapArt), in pixels. Overlay offsets/hit rects use this space.
CANVAS_W, CANVAS_H = 1002, 668
ZONE_MAP_TYPE = "3"   # UiMap.Type 3 = Zone

# Appended to the generated Lua: merge the estimates into the harvested export without
# overriding it. ExportDB auto-creates missing sub-tables on read (autotable __index), so an
# area/map entry always "exists"; the check is therefore on how many coordinates it holds.
INJECT_LUA = """
-- Inject estimates for any area/map pair the harvested ExplorationAreaPositionDB has no coordinates for.
-- ExportDB auto-creates missing sub-tables when they are read, so check the coordinate count
-- rather than whether the entry exists.
local explorationDB = ExportDB.ExplorationAreaPositionDB;
for areaID, estimatedMaps in pairs(ExplorationAreaPositionDB_Estimated) do
	local areaCoords = explorationDB[areaID];
	for mapID, coords in pairs(estimatedMaps) do
		if #areaCoords[mapID] < 1 then
			areaCoords[mapID] = coords;
		end
	end
end
"""


def load_table(wago_dir, name):
    """Load the newest <name>.<build>.csv in wago_dir (locale-specific files are ignored)."""
    pattern = re.compile(rf"^{re.escape(name)}\.(\d+(?:\.\d+)+)\.csv$")
    candidates = []
    for path in glob.glob(os.path.join(wago_dir, f"{name}.*.csv")):
        m = pattern.match(os.path.basename(path))
        if m:
            candidates.append((tuple(int(x) for x in m.group(1).split(".")), path))
    if not candidates:
        raise FileNotFoundError(f"No {name}.<build>.csv found in {wago_dir}")
    build, path = max(candidates)
    with open(path, encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f)), ".".join(map(str, build))


def load_existing_positions(export_path):
    """Parse ExportDB.ExplorationAreaPositionDB = { [areaID] = { [uiMapID] = { {x, y}, ... } } }."""
    if not os.path.exists(export_path):
        return {}
    text = open(export_path, encoding="utf-8").read()
    body = text.split("ExplorationAreaPositionDB=", 1)[-1]
    positions = {}
    stack, key, nums = [], None, []
    for k, num, opener, closer in re.findall(r"\[(\d+)\]|(-?[\d.]+)|(\{)|(\})", body):
        if k:
            key = k
        elif opener:
            stack.append(key)
            key = None
        elif closer:
            if len(stack) == 4 and len(nums) >= 2:   # {x, y} under [areaID][uiMapID]
                area, ui_map = stack[1], stack[2]
                positions.setdefault(area, {}).setdefault(ui_map, []).append((float(nums[0]), float(nums[1])))
            if len(stack) == 4:
                nums = []
            stack.pop()
        elif num and len(stack) == 4:
            nums.append(num)
    return positions


def rect_of(row, kind):
    """Return (left, top, right, bottom) in canvas pixels for a WorldMapOverlay row."""
    if kind == "hit":
        return (int(row["HitRectLeft"]), int(row["HitRectTop"]), int(row["HitRectRight"]), int(row["HitRectBottom"]))
    x, y = int(row["OffsetX"]), int(row["OffsetY"])
    return (x, y, x + int(row["TextureWidth"]), y + int(row["TextureHeight"]))


def area_px(r):
    return max(0, r[2] - r[0]) * max(0, r[3] - r[1])


def estimate(pieces):
    """Pick the largest overlay piece; use its hit rect, or its texture rect when the hit rect is empty."""
    best, best_kind = None, None
    for row in pieces:
        hit = rect_of(row, "hit")
        kind, r = ("hit", hit) if area_px(hit) > 0 else ("texture", rect_of(row, "texture"))
        if best is None or area_px(r) > area_px(best):
            best, best_kind = r, kind
    cx = (best[0] + best[2]) / 2 / CANVAS_W * 100
    cy = (best[1] + best[3]) / 2 / CANVAS_H * 100
    bounds = (best[0] / CANVAS_W * 100, best[1] / CANVAS_H * 100, best[2] / CANVAS_W * 100, best[3] / CANVAS_H * 100)
    return (round(cx, 1), round(cy, 1)), best_kind, bounds


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--wago", default=DEFAULT_WAGO, help="folder with the wago DB2 CSV exports")
    ap.add_argument("--export", default=DEFAULT_EXPORT, help="existing ExplorationAreaPositionDB.lua")
    ap.add_argument("--out", default=HERE, help="output folder")
    args = ap.parse_args()

    areas_rows, build = load_table(args.wago, "AreaTable")
    ui_maps_rows, _ = load_table(args.wago, "UiMap")
    assignment_rows, _ = load_table(args.wago, "UiMapAssignment")
    overlay_rows, _ = load_table(args.wago, "WorldMapOverlay")

    areas = {r["ID"]: r for r in areas_rows}
    ui_maps = {r["ID"]: r for r in ui_maps_rows}

    # Zone AreaID -> zone UiMapID (zone-type maps only)
    zone_ui_map = {}
    for r in assignment_rows:
        if r["AreaID"] != "0" and ui_maps.get(r["UiMapID"], {}).get("Type") == ZONE_MAP_TYPE:
            zone_ui_map.setdefault(r["AreaID"], r["UiMapID"])

    def zone_of(area_id):
        seen = set()
        while areas.get(area_id, {}).get("ParentAreaID", "0") not in ("0", "") and area_id not in seen:
            seen.add(area_id)
            area_id = areas[area_id]["ParentAreaID"]
        return area_id

    pieces = defaultdict(lambda: defaultdict(list))   # areaID -> UiMapArtID -> overlay rows
    for row in overlay_rows:
        for k in ("AreaID_0", "AreaID_1", "AreaID_2", "AreaID_3"):
            if row.get(k) not in (None, "", "0"):
                pieces[row[k]][row["UiMapArtID"]].append(row)

    existing = load_existing_positions(args.export)

    # Assign each map art to the UiMap most of its areas belong to.
    art_votes = defaultdict(lambda: defaultdict(int))
    for area_id, by_art in pieces.items():
        ui_map = zone_ui_map.get(zone_of(area_id))
        if ui_map:
            for art in by_art:
                art_votes[art][ui_map] += 1
    art_map = {art: max(votes, key=lambda u: (votes[u], -int(u))) for art, votes in art_votes.items()}

    # Score each art against harvested points on its map.
    art_error = defaultdict(list)   # (uiMapID, artID) -> distances
    for area_id, by_art in pieces.items():
        for art, rows in by_art.items():
            ui_map = art_map.get(art)
            harvested = existing.get(area_id, {}).get(ui_map)
            if harvested:
                pt = estimate(rows)[0]
                art_error[(ui_map, art)].append(min(math.dist(pt, h) for h in harvested))

    def pick_art(ui_map, arts):
        scored = [(sum(art_error[(ui_map, a)]) / len(art_error[(ui_map, a)]), a) for a in arts if art_error[(ui_map, a)]]
        if len(scored) == len(arts) and scored:
            return min(scored)[1], "best match to harvested points"
        return max(arts, key=int), "newest art"

    art_conflicts = []
    estimates, skipped, comparisons = [], [], []
    for area_id, by_art in pieces.items():
        if area_id not in areas:
            skipped.append((area_id, "?", "not in AreaTable"))
            continue
        name = areas[area_id]["AreaName_lang"]
        per_map = defaultdict(list)
        for art in by_art:
            if art in art_map:
                per_map[art_map[art]].append(art)
        if not per_map:
            skipped.append((area_id, name, f"no zone UiMap for zone {zone_of(area_id)} in UiMapAssignment"))
            continue
        for ui_map, arts in per_map.items():
            art, why = pick_art(ui_map, arts)
            point, kind, bounds = estimate(by_art[art])
            if len(arts) > 1:
                others = {a: estimate(by_art[a])[0] for a in arts if a != art}
                spread = max(math.dist(point, q) for q in others.values())
                if spread > 1:
                    art_conflicts.append((spread, area_id, name, ui_map, art, why, point, others))
            harvested = existing.get(area_id, {}).get(ui_map)
            if harvested:
                d = min(math.dist(point, h) for h in harvested)
                inside = any(bounds[0] <= h[0] <= bounds[2] and bounds[1] <= h[1] <= bounds[3] for h in harvested)
                comparisons.append((d, inside, area_id, name, ui_map, point, harvested[0], kind))
                continue
            estimates.append((area_id, ui_map, point, kind, name, ui_maps.get(ui_map, {}).get("Name_lang", "?")))

    # --- Lua output -------------------------------------------------------
    lua_path = os.path.join(args.out, "ExplorationPositions.lua")
    grouped = defaultdict(list)
    for area_id, ui_map, point, kind, name, map_name in estimates:
        grouped[area_id].append((int(ui_map), point, kind, name, map_name))
    with open(lua_path, "w", encoding="utf-8", newline="\r\n") as f:
        f.write("-- ESTIMATED exploration positions, generated by ExplorationPositions.py from DB2 data.\n")
        f.write(f"-- Build: {build}. Centre of each area's largest WorldMapOverlay piece on each map.\n")
        f.write("-- These are NOT in-game harvested points: they are only injected into\n")
        f.write("-- ExportDB.ExplorationAreaPositionDB for area/map pairs that have no harvested coordinate.\n")
        f.write("-- Do not edit by hand; re-run ExplorationPositions.py to regenerate.\n")
        f.write("-- [areaID] = { [uiMapID] = { { x, y } } },\t-- Area Name (Map [source rect], ...)\n")
        f.write("local ExplorationAreaPositionDB_Estimated = {\n")
        for area_id in sorted(grouped, key=int):
            entries = sorted(grouped[area_id])
            maps = ", ".join(f"[{u}] = {{ {{ {x:g}, {y:g} }} }}" for u, (x, y), _, _, _ in entries)
            where = ", ".join(f"{m} [{k}]" for _, _, k, _, m in entries)
            f.write(f"\t[{area_id}] = {{ {maps} }},\t-- {entries[0][3]} ({where})\n")
        f.write("};\n")
        f.write(INJECT_LUA)

    # --- Report -----------------------------------------------------------
    report_path = os.path.join(args.out, "ExplorationPositions_Report.txt")
    with open(report_path, "w", encoding="utf-8", newline="\r\n") as f:
        f.write(f"ExplorationPositions report  (build {build})\n\n")
        f.write(f"Overlay areas: {len(pieces)}\n")
        f.write(f"Area/map pairs already harvested (used for validation): {len(comparisons)}\n")
        f.write(f"New estimates written: {len(estimates)} positions for {len(grouped)} areas\n")
        f.write(f"Skipped areas: {len(skipped)}\n\n")
        if comparisons:
            ds = sorted(c[0] for c in comparisons)
            pct = lambda p: ds[min(len(ds) - 1, int(len(ds) * p))]
            f.write("Accuracy vs harvested points (distance in map % units, 0-100 scale):\n")
            f.write(f"  median {pct(0.5):.1f}   75th {pct(0.75):.1f}   90th {pct(0.9):.1f}   max {ds[-1]:.1f}\n")
            f.write(f"  harvested point inside the chosen overlay rect: {sum(c[1] for c in comparisons)}/{len(comparisons)}\n\n")
            f.write("Largest disagreements with harvested points:\n")
            for d, inside, area_id, name, ui_map, point, h, kind in sorted(comparisons, reverse=True)[:15]:
                f.write(f"  {d:5.1f}  [{area_id}] {name} on {ui_map}: estimate {point} vs harvested {h} [{kind}]\n")
            f.write("\n")
        if art_conflicts:
            f.write(f"Area/map pairs whose map arts disagree by more than 1 unit ({len(art_conflicts)}):\n")
            for spread, area_id, name, ui_map, art, why, point, others in sorted(art_conflicts, reverse=True):
                alt = ", ".join(f"art {a} {p}" for a, p in others.items())
                f.write(f"  {spread:5.1f}  [{area_id}] {name} on {ui_map}: used art {art} {point} ({why}); {alt}\n")
            f.write("\n")
        if skipped:
            f.write("Skipped areas:\n")
            for area_id, name, why in sorted(skipped, key=lambda s: int(s[0])):
                f.write(f"  [{area_id}] {name}: {why}\n")

    print(f"Build {build}: {len(estimates)} estimated positions for {len(grouped)} areas -> {lua_path}")
    print(f"Report -> {report_path}")


if __name__ == "__main__":
    main()
