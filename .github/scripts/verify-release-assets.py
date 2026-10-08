"""Verify that a tagged release contains the exact files made by the packager."""

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
from urllib.parse import quote
import zipfile


def github_api(endpoint, *, output=subprocess.PIPE, binary=False, paginate=False):
    command = ["gh", "api", "--method", "GET", endpoint]
    if binary:
        command += ["-H", "Accept: application/octet-stream"]
    if paginate:
        command += ["--paginate", "--slurp"]
    return subprocess.run(command, stdout=output, check=True).stdout


def file_digest(file):
    digest = hashlib.sha256()
    for block in iter(lambda: file.read(1024 * 1024), b""):
        digest.update(block)
    return digest.hexdigest()


def find_archive(directory, tag):
    metadata = json.loads((Path(directory) / "release.json").read_text())
    matches = [
        item["filename"] for item in metadata["releases"]
        if item.get("version") == tag and item.get("nolib") is False
    ]
    # ATT disables no-lib creation and produces one ZIP for all game flavors.
    if len(matches) != 1:
        raise ValueError("release.json must identify exactly one ATT archive for this tag")
    name = matches[0]
    if not name.endswith(".zip") or "/" in name or "\\" in name:
        raise ValueError(f"invalid archive filename in release.json: {name}")
    return Path(directory) / name


def verify(archive, tag, repository):
    if not archive:
        raise ValueError("an archive path is required")
    archive = Path(archive)
    metadata = archive.parent / "release.json"
    for path in (archive, metadata):
        if not path.is_file() or path.stat().st_size == 0:
            raise ValueError(f"missing or empty local asset: {path}")
    with zipfile.ZipFile(archive) as package:
        corrupt = package.testzip()
        if corrupt:
            raise ValueError(f"corrupt local ZIP entry: {corrupt}")
    releases = json.loads(metadata.read_text())["releases"]
    if not any(
        item.get("filename") == archive.name and item.get("version") == tag
        for item in releases
    ):
        raise ValueError("release.json does not describe this archive and tag")
    expected_files = {}
    for path in (archive, metadata):
        with path.open("rb") as local:
            digest = file_digest(local)
            expected_files[path] = (local.tell(), digest)

    prefix = f"repos/{repository}/releases"
    release = json.loads(github_api(f"{prefix}/tags/{quote(tag, safe='')}"))
    if release["tag_name"] != tag or release["draft"]:
        raise ValueError("the expected published GitHub release was not found")
    pages = json.loads(github_api(f"{prefix}/{release['id']}/assets", paginate=True))
    assets = [asset for page in pages for asset in page]
    for path, (size, expected) in expected_files.items():
        matches = [asset for asset in assets if asset["name"] == path.name]
        if len(matches) != 1:
            raise ValueError(f"expected one GitHub asset named {path.name}")
        asset = matches[0]
        if asset["state"] != "uploaded" or asset["size"] != size:
            raise ValueError(f"incomplete GitHub asset: {path.name}")
        with tempfile.TemporaryFile() as downloaded:
            github_api(f"{prefix}/assets/{asset['id']}", output=downloaded, binary=True)
            if downloaded.tell() != size:
                raise ValueError(f"downloaded asset has the wrong size: {path.name}")
            downloaded.seek(0)
            if file_digest(downloaded) != expected:
                raise ValueError(f"downloaded asset differs from local file: {path.name}")
        print(f"Verified {path.name} (sha256:{expected})")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    source = parser.add_mutually_exclusive_group(required=True)
    source.add_argument("--archive", help="Explicit final ZIP path (with sibling release.json)")
    source.add_argument("--release-directory", help="Packager output directory")
    parser.add_argument("--tag", required=True)
    parser.add_argument("--repository", required=True)
    args = parser.parse_args()
    try:
        archive = args.archive if args.archive is not None else find_archive(args.release_directory, args.tag)
        verify(archive, args.tag, args.repository)
    except (OSError, ValueError, KeyError, TypeError, zipfile.BadZipFile,
            subprocess.CalledProcessError) as error:
        print(f"Release asset verification failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
