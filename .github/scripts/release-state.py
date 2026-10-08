#!/usr/bin/env python3
"""Preserve release evidence and refuse replay after publication may have started."""

import hashlib
import json
import os
from pathlib import Path
import shutil
import sys
import urllib.parse
import urllib.request


INTENT_STEP = "Save publish intent: "
PACKAGE_STEP = "Package and release"


def release_key(sha, ref):
    if ref.startswith("refs/tags/"):
        # A moved tag must not bypass the guard with a different SHA.
        return "tag-" + hashlib.sha256(ref.encode()).hexdigest()
    return "alpha-" + sha


class GitHub:
    def __init__(self, repository, token):
        self.base = f"https://api.github.com/repos/{repository}"
        self.token = token

    def get(self, path, query):
        request = urllib.request.Request(
            self.base + path + "?" + urllib.parse.urlencode(query),
            headers={
                "Authorization": "Bearer " + self.token,
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28",
            },
        )
        with urllib.request.urlopen(request, timeout=30) as response:
            return json.load(response)

    def pages(self, path, field, **query):
        items = []
        page = 1
        while True:
            data = self.get(path, dict(query, per_page=100, page=page))
            batch = data[field]
            items.extend(batch)
            # Filtered workflow searches are limited to 1,000 results.
            if field == "workflow_runs" and query and data["total_count"] > 1000:
                raise RuntimeError("Publication history exceeds GitHub's search limit")
            if len(batch) < 100:
                if len(items) != data["total_count"]:
                    raise RuntimeError("Incomplete publication history")
                return items
            page += 1


def started(step):
    status = step.get("status")
    if status in ("in_progress", "completed"):
        return step.get("conclusion") != "skipped"
    if status in ("pending", "queued"):
        return False
    raise RuntimeError("Incomplete publication step metadata")


def previous_publications(api, sha, ref):
    key = release_key(sha, ref)
    tagged = ref.startswith("refs/tags/")
    query = {} if tagged else {"head_sha": sha}
    runs = api.pages("/actions/workflows/Release.yml/runs", "workflow_runs", **query)
    publications = []
    for run in runs:
        # Tags use their exact name, including a previous SHA after a moved tag.
        # Null branch metadata is ambiguous, so inspect its explicit intent key.
        if tagged and run.get("head_branch") not in (ref[10:], None):
            continue
        jobs = api.pages(f"/actions/runs/{run['id']}/jobs", "jobs", filter="all")
        for job in jobs:
            if job["name"] != "release-linux":
                continue
            if "steps" not in job and job.get("status") == "queued":
                continue
            steps = job["steps"]
            markers = [s for s in steps if s["name"].startswith(INTENT_STEP)]
            has_intent = any(s["name"] == INTENT_STEP + key and started(s) for s in markers)
            if not markers:
                # Protect publications made before the intent checkpoint existed.
                legacy_match = (run.get("head_branch") in (ref[10:], None)) if tagged else (
                    run["head_sha"] == sha and run["event"] != "push"
                )
                has_intent = legacy_match and any(
                    s["name"] == PACKAGE_STEP and started(s) for s in steps
                )
            if has_intent:
                publications.append((run["id"], job.get("run_attempt"), job.get("conclusion")))
    return publications


def guard(api, sha, ref):
    prior = previous_publications(api, sha, ref)
    if not prior:
        return True
    if not ref.startswith("refs/tags/") and all(p[2] == "success" for p in prior):
        print("::notice::This HEAD already reached publication in a successful release job; skipping another alpha. Platform results remain unverified.")
        return False
    attempts = ", ".join(f"run {run}, attempt {attempt}: {result or 'unfinished'}" for run, attempt, result in prior)
    raise RuntimeError(
        "Publication may already have occurred (" + attempts + "). "
        "Automatic replay is blocked. Download the saved release evidence and "
        "reconcile each platform before recovering manually; see .github/RELEASE-RECOVERY.md."
    )


def context():
    return {
        "key": release_key(os.environ["GITHUB_SHA"], os.environ["GITHUB_REF"]),
        "sha": os.environ["GITHUB_SHA"],
        "ref": os.environ["GITHUB_REF"],
        "repository": os.environ["GITHUB_REPOSITORY"],
        "run_id": os.environ["GITHUB_RUN_ID"],
        "run_attempt": os.environ["GITHUB_RUN_ATTEMPT"],
    }


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + "\n")


def snapshot(directory, evidence, info, outcome):
    evidence.mkdir(parents=True, exist_ok=True)
    files = sorted(directory.glob("*.zip"))
    metadata = directory / "release.json"
    if metadata.is_file():
        files.append(metadata)
    records = []
    for path in files:
        target = evidence / path.name
        shutil.copyfile(path, target)
        records.append({
            "name": path.name,
            "size": target.stat().st_size,
            "sha256": hashlib.sha256(target.read_bytes()).hexdigest(),
        })
    zip_saved = any(record["name"].endswith(".zip") and record["size"] > 0 for record in records)
    result = dict(info, packager_outcome=outcome, files=records, final_zip_saved=zip_saved,
                  platforms={"curseforge": "unverified", "wago": "unverified",
                             "github": "unverified" if info["ref"].startswith("refs/tags/") else "not-applicable"})
    write_json(evidence / "results.json", result)
    (evidence / "SHA256SUMS").write_text("".join(
        f"{record['sha256']}  {record['name']}\n" for record in records
    ))
    if not zip_saved:
        raise RuntimeError("No final ZIP was saved; platform effects are unknown and replay remains blocked")


def main():
    info = context()
    evidence = Path(".release/release-evidence")
    command = sys.argv[1]
    if command == "guard":
        allowed = guard(GitHub(info["repository"], os.environ["GH_TOKEN"]), info["sha"], info["ref"])
        with open(os.environ["GITHUB_OUTPUT"], "a") as output:
            output.write(f"key={info['key']}\npublish={str(allowed).lower()}\n")
    elif command == "intent":
        write_json(evidence / "publish-intent.json", info)
    elif command == "snapshot":
        snapshot(Path(".release"), evidence, info, os.environ["PACKAGE_OUTCOME"])
    else:
        raise RuntimeError("Unknown command: " + command)


if __name__ == "__main__":
    try:
        main()
    except Exception as error:
        print("::error::" + str(error), file=sys.stderr)
        sys.exit(1)
