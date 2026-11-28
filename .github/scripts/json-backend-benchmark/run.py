import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import time

BACKENDS = ("SystemTextJson", "MiniJson", "NewtonsoftJson")
PROJECTS = {
    "Parser": ".contrib/src/Parser/Parser.csproj",
    "Blizzard API Harvester": ".contrib/src/Blizzard API Harvester/Blizzard API Harvester.csproj",
    "Classic Item Detector": ".contrib/src/Classic Item Detector/Classic Item Detector.csproj",
    "Item DB Compare Tool": ".contrib/src/Item DB Compare Tool/Item DB Compare Tool.csproj",
    "AssetDB Builder": ".contrib/.source/AssetDB Builder/AssetDB Builder.csproj",
}
DATA = (
    ".contrib/.db/standard/00 - Item DB/itemDB.json",
    ".contrib/.db/standard/00 - Item DB/questDB.json",
    ".contrib/Harvesters/RAW_classicItemDB.json",
    ".contrib/Harvesters/classicItemDB.json",
    ".contrib/Harvesters/classicItemIDs.json",
)
ASSET_COUNT = 25_000
GRAPH_COUNT = 4096


def sha(data):
    return hashlib.sha256(data).hexdigest()


def invoke(command, cwd):
    result = subprocess.run(command, cwd=cwd, capture_output=True, check=False, timeout=300)
    if result.returncode:
        raise RuntimeError(f"{command} failed ({result.returncode}):\n"
                           + (result.stdout + result.stderr).decode("utf-8", "replace"))
    return result.stdout.decode("utf-8", "replace")


def build(project, backend, output, scratch, sources, *, target=None, any_cpu=False):
    cmd = ["dotnet", "build", str(project), "-c", "Release", "-p:Platform=x64",
           f"-p:AttJsonBackend={backend}", "--output", str(output),
           "--artifacts-path", str(output.parent / f"obj-{output.name}"), "--nologo",
           "--disable-build-servers", "-m:1", "-nr:false", "-v:minimal"]
    for source in sources:
        cmd.extend(("--source", source))
    if target:
        cmd.append(f"-p:BenchmarkFramework={target}")
    if any_cpu:
        cmd.append("-p:PlatformTarget=AnyCPU")
    print(f"Building {project.stem} · {target or 'production'} · {backend}", flush=True)
    invoke(cmd, scratch)


def probe(command, operation, fixture, validation, warm_samples, scratch, asset_keys):
    stdout = invoke(command + [operation, str(fixture), str(validation), str(warm_samples)], scratch)
    samples = []
    peak = None
    digest = None
    for line in stdout.splitlines():
        label, *values = line.split("\t")
        if label in ("cold", "warm"):
            ms, cpu, allocated, gc0, gc1, gc2 = values
            samples.append({"phase": label, "wall_ms": float(ms), "cpu_ms": float(cpu),
                            "allocated_bytes": int(allocated), "gc": list(map(int, (gc0, gc1, gc2)))})
        elif label == "peak":
            peak = int(values[0])
        elif label == "valid":
            digest = values[0]
    assert len(samples) == 1 + warm_samples and peak is not None and digest is not None, stdout
    raw = None
    if operation == "parser-write":
        raw = validation.read_bytes()
        value = json.loads(raw)
        expected = {"g": "<ignored>", "42": [
            {"itemID": 10000 + index, "text": 'Harbor 港口 "quoted"\nnext line',
             "values": [index + 0.5, False, None], "__parent": "<ignored>"}
            for index in range(GRAPH_COUNT)
        ]}
        assert value == expected
        digest = sha(json.dumps(value, sort_keys=True, ensure_ascii=False).encode("utf-8"))
    elif operation == "ordinary-write":
        raw = validation.read_bytes()
        expected = json.loads(fixture.read_bytes())
        assert json.loads(raw) == expected
        digest = sha(json.dumps(expected, sort_keys=True, ensure_ascii=False).encode("utf-8"))
    elif operation == "asset-keys":
        raw = validation.read_bytes()
        assert raw == ",".join(map(str, asset_keys)).encode("ascii")
        digest = sha(raw)
    return {"samples": samples, "peak_working_set_bytes": peak, "digest": digest,
            "raw_bytes": len(raw) if raw is not None else None,
            "raw_digest": sha(raw) if raw is not None else None}


def rotated(trial):
    return BACKENDS[trial % len(BACKENDS):] + BACKENDS[:trial % len(BACKENDS)]


def deployment(output, name):
    artifacts = sorted(p for p in output.rglob("*")
                       if p.is_file() and p.suffix.lower() not in {".pdb", ".xml"})
    dlls = {
        p.relative_to(output).as_posix(): p.stat().st_size
        for p in artifacts if p.suffix.lower() == ".dll"
    }
    executable = next(p for p in artifacts if p.name in {name, name + ".exe"})
    return {"exe_bytes": executable.stat().st_size, "main_dll_bytes": dlls.get(name + ".dll"),
            "deployment_bytes": sum(p.stat().st_size for p in artifacts), "dlls": dlls}


def summarize(report):
    lines = ["# Three JSON backends on one runner", "",
             f"Production source {report['source']} · SDK {report['sdk']} · {report['platform']}", "",
             f"Corpus: {report['corpus_files']} tracked inputs, {report['corpus_bytes']:,} bytes. "
             f"Parser debug graph: {GRAPH_COUNT:,} entries. AssetDB fixture: {ASSET_COUNT:,} numeric IDs. "
             "Ordinary serialization uses the decoded classicItemDB.json.", "",
             "Cold is the first backend operation after process startup and input preparation. "
             "Warm samples follow two unmeasured operations. Medians use the raw samples across "
             "fresh-process trials. Managed allocation counts bytes from the measurement thread. "
             "Peak working set is the whole process through the timed work, before validation. "
             "CPU time is the process delta at OS timer resolution. Timing has no pass/fail threshold.", "",
             "| Runtime | Operation | Backend | Cold wall ms | Warm wall ms | Warm CPU ms | Warm allocated MiB | Peak working set MiB | Warm GC 0/1/2 total |",
             "|---|---|---|---:|---:|---:|---:|---:|---:|"]
    for key, probes in report["probes"].items():
        target, operation, backend = key.split("/")
        cold = [s for p in probes for s in p["samples"] if s["phase"] == "cold"]
        warm = [s for p in probes for s in p["samples"] if s["phase"] == "warm"]
        gcs = "/".join(str(sum(s["gc"][g] for s in warm)) for g in range(3))
        peaks = [p["peak_working_set_bytes"] / 2**20 for p in probes if p["peak_working_set_bytes"] > 0]
        peak = f"{statistics.median(peaks):.2f}" if peaks else "N/A"
        lines.append(f"| {target} | {operation} | {backend} | {statistics.median(s['wall_ms'] for s in cold):.2f} | "
                     f"{statistics.median(s['wall_ms'] for s in warm):.2f} | "
                     f"{statistics.median(s['cpu_ms'] for s in warm):.2f} | "
                     f"{statistics.median(s['allocated_bytes'] for s in warm) / 2**20:.3f} | "
                     f"{peak} | {gcs} |")
    lines += ["", "## AssetDB Builder full process", "",
              "Wall time includes executable startup, fixture input and Lua output to a fresh directory.", "",
              "| Backend | Median wall ms | Lua SHA-256 |", "|---|---:|---|"]
    for backend, runs in report["assetdb"].items():
        lines.append(f"| {backend} | {statistics.median(r['wall_ms'] for r in runs):.2f} | `{runs[0]['lua_sha256']}` |")
    lines += ["", "## Release x64 deployment sizes", "",
              "Runtime directory totals include configuration and native DLLs. PDB and XML documentation are excluded. "
              "AssetDB Builder uses an apphost and managed entry DLL. The artifact lists every DLL.", "",
              "| Tool | Backend | EXE bytes | Entry DLL bytes | JSON DLL bytes | Total bytes |",
              "|---|---|---:|---:|---:|---:|"]
    for key, size in report["deployments"].items():
        tool, backend = key.split("/")
        json_dlls = [f"{name} ({value:,})" for name, value in size["dlls"].items()
                     if name in {"System.Text.Json.dll", "Newtonsoft.Json.dll"}]
        entry = size["main_dll_bytes"]
        lines.append(f"| {tool} | {backend} | {size['exe_bytes']:,} | "
                     f"{f'{entry:,}' if entry is not None else '—'} | "
                     f"{', '.join(json_dlls) or '—'} | {size['deployment_bytes']:,} |")
    lines += ["", "## Correctness", ""]
    if report["differences"]:
        lines += [f"- {value}" for value in report["differences"]]
    else:
        lines.append("All three backends agreed on typed corpus values within each runtime, "
                     "normalized Parser and ordinary JSON, sorted AssetDB IDs, and the exact Lua output.")
    return "\n".join(lines) + "\n"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--scratch", required=True, type=Path)
    parser.add_argument("--results", required=True, type=Path)
    parser.add_argument("--expected-source", default="4f7bcc6aabecba267a7e9659b34b2ee01f60d490")
    parser.add_argument("--restore-source", action="append", default=[])
    parser.add_argument("--local-smoke", action="store_true")
    args = parser.parse_args()
    scratch = args.scratch.resolve()
    scratch.mkdir(parents=True)
    results = args.results.resolve()
    results.mkdir(parents=True, exist_ok=True)
    repo = Path(__file__).resolve().parents[3]
    script_dir = Path(__file__).resolve().parent
    source = invoke(["git", "rev-parse", "HEAD" if args.local_smoke else "HEAD^"], repo).strip()
    if source != args.expected_source:
        raise RuntimeError(f"Unexpected production revision {source}")
    if not args.local_smoke:
        edits = invoke(["git", "diff", "--name-only", source, "HEAD"], repo).splitlines()
        if any(not p.startswith(".github/scripts/json-backend-benchmark/")
               and p != ".github/workflows/JsonBackendComparison.yml" for p in edits):
            raise RuntimeError(f"Temporary branch changes production files: {edits}")
    (scratch / "global.json").write_text(
        '{"sdk":{"version":"10.0.100","rollForward":"latestMinor","allowPrerelease":false}}',
        encoding="utf-8")
    report = {"source": source, "sdk": invoke(["dotnet", "--version"], scratch).strip(),
              "platform": platform.platform(), "processor": os.environ.get("PROCESSOR_IDENTIFIER", platform.processor()),
              "dotnet_runtimes": invoke(["dotnet", "--list-runtimes"], scratch).splitlines(),
              "logical_cpus": os.cpu_count(), "probes": {}, "assetdb": {}, "deployments": {}, "differences": []}
    if not args.local_smoke:
        report["net_framework"] = invoke(
            ["reg", "query", r"HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full", "/v", "Release"],
            scratch).strip()

    tracked = invoke(["git", "ls-files", "-z", "--", ".contrib/.db"], repo).split("\0")
    configs = sorted(repo / path for path in tracked if path.endswith(".config"))
    corpus = configs + [repo / name for name in DATA]
    assert len(configs) == 23 and len(corpus) == 28
    report["corpus_files"] = len(corpus)
    report["corpus_bytes"] = sum(p.stat().st_size for p in corpus)
    report["corpus"] = [{"path": p.relative_to(repo).as_posix(), "bytes": p.stat().st_size,
                         "sha256": sha(p.read_bytes())} for p in corpus]
    manifest = scratch / "corpus.txt"
    manifest.write_text("\n".join(map(str, corpus)) + "\n", encoding="utf-8")

    asset_keys = list(range(100000, 100000 + ASSET_COUNT))
    fixture_text = json.dumps({str(i): {"name": f"Asset {i}", "tags": [1, 2, {"active": True}]}
                               for i in reversed(asset_keys)}, separators=(",", ":"))
    asset_input = scratch / "asset.json"
    asset_input.write_text(fixture_text, encoding="utf-8")
    expected_lua = ("-- #if sample\n_.AssetDB = {\n" + "".join(f"[{i}]=1,\n" for i in asset_keys)
                    + "};\n-- #endif\n")
    report["asset_fixture_bytes"] = asset_input.stat().st_size
    report["expected_lua_normalized_sha256"] = sha(expected_lua.encode("utf-8"))

    targets = ("net10.0",) if args.local_smoke else ("net481", "net10.0")
    trials = 1 if args.local_smoke else 3
    warm_samples = 1 if args.local_smoke else 3
    report.update(trials=trials, warm_samples=warm_samples)
    probe_exes = {}
    asset_exes = {}
    for backend in BACKENDS:
        for tool, relative in PROJECTS.items():
            if args.local_smoke and tool != "AssetDB Builder":
                continue
            out = scratch / "tools" / backend / tool
            build(repo / relative, backend, out, scratch, args.restore_source, any_cpu=args.local_smoke)
            report["deployments"][f"{tool}/{backend}"] = deployment(out, tool)
            if tool == "AssetDB Builder":
                asset_exes[backend] = [str(out / (tool if args.local_smoke else tool + ".exe"))]
        for target in targets:
            out = scratch / "probe" / backend / target
            build(script_dir / "JsonBackendBenchmark.csproj", backend, out, scratch, args.restore_source,
                  target=target, any_cpu=args.local_smoke)
            executable = out / "JsonBackendBenchmark.exe"
            probe_exes[target, backend] = ([str(executable)] if target == "net481"
                                           else ["dotnet", str(executable.with_suffix(".dll"))])

    operations = {"read": manifest, "parser-write": manifest,
                  "ordinary-write": repo / ".contrib/Harvesters/classicItemDB.json",
                  "asset-keys": asset_input}
    validation = scratch / "validation.json"
    for target in targets:
        for operation, fixture in operations.items():
            for trial in range(trials):
                for backend in rotated(trial):
                    key = f"{target}/{operation}/{backend}"
                    print(f"Measuring {key} (fresh process {trial + 1}/{trials})", flush=True)
                    sample = probe(probe_exes[target, backend], operation, fixture, validation,
                                   warm_samples, scratch, asset_keys)
                    report["probes"].setdefault(key, []).append(sample)
            digests = {probe_result["digest"] for backend in BACKENDS
                       for probe_result in report["probes"][f"{target}/{operation}/{backend}"]}
            if len(digests) != 1:
                report["differences"].append(f"{target} {operation} fingerprints differ: {sorted(digests)}")

    for trial in range(trials):
        for backend in rotated(trial):
            fixture = scratch / "assetdb-fixtures" / backend / str(trial)
            cwd = fixture / ".tools"
            input_dir = fixture / ".raw" / "AssetDB"
            cwd.mkdir(parents=True)
            input_dir.mkdir(parents=True)
            (input_dir / "sample.json").write_bytes(asset_input.read_bytes())
            start = time.perf_counter()
            invoke(asset_exes[backend], cwd)
            wall_ms = (time.perf_counter() - start) * 1000
            lua = (fixture / ".db" / "standard" / "00 - DB" / "AssetDB" / "sample.lua").read_bytes()
            assert lua.decode("utf-8-sig").replace("\r\n", "\n") == expected_lua
            report["assetdb"].setdefault(backend, []).append({"wall_ms": wall_ms, "lua_sha256": sha(lua)})
    if len({sample["lua_sha256"] for runs in report["assetdb"].values() for sample in runs}) != 1:
        report["differences"].append("AssetDB Lua bytes differ despite matching normalized output.")

    summary = summarize(report)
    (results / "report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    (results / "summary.md").write_text(summary, encoding="utf-8")
    if os.environ.get("GITHUB_STEP_SUMMARY"):
        with Path(os.environ["GITHUB_STEP_SUMMARY"]).open("a", encoding="utf-8") as output:
            output.write(summary)
    print(summary)
    if report["differences"]:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
