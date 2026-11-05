# Phase authoring design

Status: proposed, not implemented; awaiting maintainer review before implementation. The existing implementation at `0ee2de3705a6eac33b6ad8ce52c0949f898bef7f` still uses the external source-selector catalog. This document specifies its proposed replacement, not an API already available in the addon.

## What maintainers change

Keep the acquisition data in Lua. Put one scheduling key on the particular source that needs an independent opening rule. Keep each flavor's opening schedule in its own JSON profile.

For an existing source, changing its opening phase is one JSON edit. Adding a source requires its Lua annotation and a schedule entry; it no longer requires a second description of the source's file path and ancestors.

| Task | Maintainer edit |
| --- | --- |
| Open an existing source in a different phase | Change its entry in that flavor's `content` map. |
| Add a raid or another acquisition source | Author its actual Lua data, add `progressionKey` on the appropriate source table, and add the desired flavor schedule entries. |
| Add a different SoD boss, reward list, or later vendor occurrence | Author and annotate that actual occurrence. Use a different key when its schedule differs. A shared NPC, item, or instance ID does not supply the missing data. |
| Add a flavor | Define its phases and schedule, select that profile in its Parser configuration, and explicitly add the appropriate build and validation coverage. A profile cannot create a client flavor or its loot database. |
| Change an ordinary phase label | Change the existing localized phase definition. Profiles inherit it through `phaseID`; they do not repeat its translations. |

This changes authoring and compilation. Players use the matching generated database and ATT's **Phases** settings page; the addon does not read these JSON files.

## Source annotation

Use a direct field on the existing acquisition table:

```lua
applyclassicphase(SOD_PHASE_FOUR, d(DIFFICULTY.SOD.PLAYER20, {
    progressionKey = "raid.mc.sod20",
    -- Existing boss and reward data stays here.
}))
```

This is a proposed annotation on the existing Molten Core SoD difficulty scope. Its ordinary `applyclassicphase` fallback remains in the source for builds that do not schedule this key. The Era/common instance scope has its own `progressionKey = "raid.mc.common"` annotation.

The key names a **scheduling scope**, not a database entity or merge identity. It does not select all occurrences of an NPC or item. The same key may be used on several actual occurrences when they intentionally share a schedule; the Parser records every occurrence and retains their separate acquisition conditions. One source table has one key. A separate nested key expresses a separately scheduled child scope.

Annotations belong to acquisition trees, not the global ItemDB or a record indexed only by item/NPC ID. The Parser consumes `progressionKey` before source merging and never exports it to the addon. It removes the field even when there is no selected profile. An annotation encountered in an unsupported compiled-data location is an error; an export guard rejects any leftover marker in every flavor. No helper wrapper or maintained path/ancestor selector is required.

## Flavor profile

The profile contains the phase definitions and the `content` schedule. Release keys are local to the profile; they are stable identifiers, not array positions. The compiler prefixes the profile ID when producing runtime keys. Profile IDs, local release keys, and scheduling keys use nonempty lowercase letters, digits, dots, underscores, and hyphens, starting with a letter or digit; a colon is reserved for the generated namespace separator. Existing `verificationStatus` and `coverage` fields remain supported as provenance notes, not scheduling inputs.

An Era profile with only Molten Core opted in would have this shape:

```json
{
    "schema": 2,
    "id": "era",
    "defaultVisibleThrough": "6",
    "phases": {
        "1": { "order": 1, "phaseID": 11 },
        "2": { "order": 2, "phaseID": 12 },
        "3": { "order": 3, "phaseID": 13 },
        "4": { "order": 4, "phaseID": 14 },
        "5": { "order": 5, "phaseID": 15 },
        "6": { "order": 6, "phaseID": 16 }
    },
    "content": {
        "raid.mc.common": "1"
    }
}
```

The current repository's SoD schedule instead maps `raid.mc.sod20` to local release `"4"`; its phase definition is `"4": { "order": 4, "phaseID": 1608 }`. The existing later Sulfuras source maps to `"5"`. These examples preserve the repository's current assumptions; they are not new evidence of game availability.

For example, a proposed scheduling change from `"raid.mc.sod20": "4"` to `"raid.mc.sod20": "5"` changes the generated opening requirement on that annotated difficulty scope. It neither replaces its boss/reward lists nor changes the Era map. A child with a separate later opening condition retains that condition.

The fields have separate jobs:

- `id` supplies the runtime namespace. Local `"4"` in `sod` compiles to the existing `"sod:4"` key. Changing a release key is a saved-choice migration, not a label edit.
- `order` determines ordering and the default visibility cutoff. Normal phases have distinct positive orders; inserting a phase does not rename existing keys.
- `defaultVisibleThrough` selects the default cutoff for **display** when no explicit choice exists. It does not claim the server is currently in that phase. It compiles to the existing runtime `baseline` field.
- `phaseID` is optional compatibility metadata, declared once per phase. For the existing Era, SoD, and Wrath profiles, that one declaration supplies numeric child-phase conversion, the existing saved numeric phase preference fallback, and localized phase text. A numeric ID can belong to only one phase in a profile. There is no separate `phaseIDs` list or `phaseMappings` table.
- `name` is an optional locale map for a custom label. Ordinary labels inherit the canonical text in `Constants/Phases.lua`. Before removing the current profile labels, fill missing `tw`/`cn` text on the referenced phase definitions using the current translated labels; do not silently replace Chinese with English. Existing canonical translations remain authoritative, including their spacing. A custom normal phase without `phaseID` must provide an English name; `tw` and `cn` are optional display overrides and may contain literal UTF-8. They do not affect identity, ordering, or availability.

An explicitly uncertain release is declared as `"unknown": { "status": "unknown" }`. This reserved key is the only unknown-status entry allowed; it has no compatibility `phaseID`. The compiler supplies the shared localized unknown label and runtime order zero unless a custom name is provided. A conflicting order is rejected. It is hidden by default, may be inspected through the existing controls, and cannot be the default cutoff. Mapping a source to `"unknown"` is different from leaving that source outside the schedule.

This contract deliberately supports one-to-one numeric compatibility. It does not infer cross-flavor equivalence from similar numbers, phase ordinals, or names. A custom release without `phaseID` does not inherit another flavor's saved numeric preferences. No additional alias table is introduced in this change.

## Opening rules and later children

The source annotation is an explicit opt-in for that source's opening rule. The following rules are applied before merging:

1. When the active profile schedules a key, add that release requirement to that exact source. Its valid scalar `phase`, if present, becomes the legacy fallback and is consumed, even if it has no `phaseID` counterpart in this profile. Validate the original field before consuming it; an invalid value or an unobtainable status in `phase` is an error, not something the annotation hides.
2. Track the nearest scalar phase encountered along the route, including an unmapped phase retained as numeric data. A repeated value is redundant only when that nearest transition was consumed. A different value starts a new transition, even if it matches an earlier ancestor. Thus A → B → A does not discard the final A merely because the raid originally used A.
3. A different descendant phase is a separate transition. If an active phase definition explicitly declares that `phaseID`, convert it to its namespaced release requirement. Otherwise retain the numeric `phase` unchanged. Do not erase an unmapped subphase merely because the raid is scheduled.
4. A scheduled child annotation adds its own opening requirement. It does not cancel the parent's requirement. Conditions within one acquisition route combine with AND; genuinely different acquisition routes remain alternatives combined with OR.
5. `u` and `e` remain independent conditions on their own routes. The new scheduling stage does not treat `u` as a phase. Existing upstream normalization of malformed release IDs authored in `u` is unchanged.

For example, a raid's fallback phase may be replaced by its profile schedule while a reward's different later phase remains required. Changing the raid's opening does not automatically reschedule that reward. If the reward itself needs an independent schedule, annotate that reward occurrence and map its key explicitly.

## Partial adoption and compatibility

With no profile, the Parser strips annotations and leaves the existing source phase, unavailable status, events, and ordinary merge behavior intact.

With a profile, an annotation omitted from `content` is inert. It adds no independent release and does not reset a scheduled ancestor. The node follows the same phase and inherited-scope handling as an unannotated node. This allows shared Classic sources to opt in separately for Era, SoD, and Wrath without requiring three exhaustive lists of ignored keys.

The build's coverage report lists such unscheduled annotations as information, without emitting a warning for each expected omission. Conversely, every scheduled key must occur in that build: zero occurrences is an error. Here an occurrence means a source node emitted after preprocessing and Lua evaluation, before merging; validating the final generated acquisition tree remains a separate check. An accidental annotation with neither a schedule entry nor a previously expected key cannot be distinguished automatically from intentional partial adoption; reviewers must inspect this coverage report.

Existing numeric defaults remain unchanged. Namespaced saved choices override the explicit numeric preference fallback; numeric unavailable filtering continues to use its original raw setting. The generated `app.ProgressionProfile`, `releasePhases`, complete-route handling, and saved namespaced keys remain compatible with the current runtime.

## Parser validation and diagnostics

Profile parsing rejects duplicate JSON properties, duplicate orders or compatibility IDs, unknown properties, invalid local release keys, missing release references, and an invalid default cutoff. This requires strict validation at the profile-reader boundary: the current general `MiniJSON` reader silently overwrites duplicate properties, so checking the resulting dictionary is insufficient. Do not change unrelated configuration parsing merely to implement this rule. Source annotation values must be nonempty keys. Two annotated nodes with the same key are permitted; they must not be merged merely because of that key.

The existing Lua phase registry contains both release phases and unavailable statuses. Before contributor source merging, the Parser takes a read-only snapshot after shared and configuration Lua has loaded. It uses the existing release metadata distinction to validate any scalar phase it will consume and each declared compatibility `phaseID`. Registry membership alone is insufficient, and numeric ranges are not a substitute. The later normal phase export remains intact; the existing build-specific Lua aliases continue to resolve before source annotation processing.

Errors identify the profile file and JSON property path, or the Lua source file plus structural occurrence path and relevant IDs. Reports include all occurrences of repeated keys, the selected release, and any retained unmapped numeric child phases. Line numbers may supplement these locations when available; the design does not require maintaining source locations by hand.

## Migration and review boundary

The design replaces the authoring interface; it does not replace the runtime route engine or add a new flavor. The following are review units and dependency order, not a promise that each unit can be activated independently. Implementation starts only after maintainer review. Its commit plan must keep the source/configuration activation coherent without adding a temporary second schema solely to divide commits.

1. In `.contrib/src/Parser/ProgressionCatalog.cs`, replace file/ancestry matching with annotation consumption, schema-2 validation, derived compatibility, and occurrence diagnostics. Add a profile-only strict duplicate-property mode in `.contrib/src/Parser/MiniJSON.cs`; its default and unrelated readers remain unchanged. Adjust `Program.cs` to provide the phase metadata snapshot at the required point. Keep the existing pre-merge hook in `Framework/Framework.Merge.cs`, the complete-source comparison/copy handling, and profile export contract. Remove the `ProgressionBindings` configuration dependency.
2. Convert `era.json`, `sod.json`, and `wrath.json` under `.contrib/.db/shared/.config/progression/`. Preserve their release keys after namespacing, orders, default visibility, schedules, uncertainty statements, and evidence. In `.contrib/.db/shared/lib/Constants/Phases.lua`, fill only missing ordinary `tw`/`cn` names for the referenced phases before removing the repeated profile labels. Review the resulting localized labels explicitly, then remove the duplicate numeric mapping tables. Remove `bindings.json` and its entry in `.contrib/.db/shared/.config/root.config` after every current binding occurrence is accounted for. Existing flavor configs keep selecting `ProgressionIdentity` and `ProgressionProfile`.
3. Move the current 17 catalog entries onto their exact source occurrences in the nine Lua files listed below. Document the optional string field on `ATTObject` in `.contrib/.db/shared/functions/Shortcuts.lua`; no new helper is needed. Retain original scalar-phase fallbacks and all boss, reward, event, and unavailable data. A key used several times requires a location-by-location migration check, not just a key count. Audit all compiled containers for marker cleanup; traversing only `g`, `groups`, `aqd`, and `hqd` is not sufficient to guarantee no leaks.
4. Update `.contrib/progression/ProgressionParserIntegrationTests.cs`, shared fixture support as required, `validate-generated.py`, and `validate-generated.lua` to validate source annotations and generated behavior. Supply the shared unknown display label once through `.contrib/.db/shared/lib/Strings/Settings/Phases/PROGRESSION_UNKNOWN.lua`; Parser export materializes its loaded translations into the existing `name` locale map, without a forward reference to runtime localization initialization. Retain runtime regressions for complete routes and independent `u`/`phase` settings. Keep the existing Parser workflow and binary provenance checks; do not add a second source registry in tests or diagnostics.
5. Once implemented and verified, update `RUNTIME_PROGRESSION.md` and `PIPELINE.md` to explain the available interface. Obtain the corresponding Parser binary from CI and pair it with its C# source in the same commit, following the repository's delivery requirements. This design document does not claim that build or validation has occurred.

The nine source files, relative to `.contrib/.db/standard/01 - Dungeons Raids/`, are:

- `01 - Classic/1.0 Molten Core.lua`
- `01 - Classic/1.5 Onyxia's Lair.lua`
- `01 - Classic/1.6 Blackwing Lair.lua`
- `01 - Classic/2.5 Ruins of Ahn'Qiraj.lua`
- `01 - Classic/2.6 Temple of Ahn'Qiraj.lua`
- `01 - Classic/3.0 Naxxramas.lua`
- `03 - Wrath of the Lich King/2 Naxxramas.lua`
- `03 - Wrath of the Lich King/5 Ulduar.lua`
- `03 - Wrath of the Lich King/8 Icecrown Citadel.lua`

## Acceptance cases

- Rescheduling one key changes only its source opening requirement; it does not change loot, another flavor's schedule, or a distinct later reward transition.
- Every old catalog occurrence is replaced, including repeated item/vendor occurrences. Existing SoD boss and reward variants remain distinct.
- A scheduled custom release without `phaseID` replaces its node's valid fallback phase, while its different unmapped child phase remains numeric. No old flavor preference is inherited accidentally.
- A repeated inherited fallback is consumed once; a different mapped child phase adds its own release; a scheduled child still requires its scheduled parent. In A → B → A, including when B remains an unmapped numeric phase, the last A converts only if the active profile declares its numeric mapping; otherwise it remains numeric. It is never discarded merely because the original A was consumed.
- No profile strips all input annotations and preserves existing behavior. An unscheduled child marker does not reset an active ancestor. Scheduled keys with zero hits and malformed phase values fail with useful locations.
- Opposing `u` and phase settings with the same number remain independent, including after profile switches and raw unavailable-setting changes.
- Local profile keys generate the existing namespaced keys, defaults, and saved-choice behavior. Existing phase localization supplies ordinary labels; custom/unknown labels and Unicode text are handled explicitly.
- Representative generated acquisition trees match the current intended schedules. Unaffected generated data remains identical, except for separately reviewed canonical-label changes caused by filling missing phase translations. Any difference caused by the more explicit source boundary is reviewed as a behavior change, not silently accepted as formatting.

No schedule, boss list, reward list, or live-client availability is established by this design. Existing unverified data assumptions remain unverified until supported by the evidence required for ATT data changes.
