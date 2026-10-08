"""Offline release-asset checks; no release or remote upload is performed."""

import importlib.util
import io
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch
import zipfile


spec = importlib.util.spec_from_file_location(
    "release_assets", Path(__file__).parents[1] / ".github/scripts/verify-release-assets.py"
)
release_assets = importlib.util.module_from_spec(spec)
spec.loader.exec_module(release_assets)


class ReleaseAssetTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.archive = Path(self.directory.name) / "AllTheThings-1.2.3.zip"
        with zipfile.ZipFile(self.archive, "w") as archive:
            archive.writestr("AllTheThings/AllTheThings.toc", "## Interface: 120000\n")
        self.metadata = self.archive.parent / "release.json"
        self.metadata.write_text(json.dumps({"releases": [
            {"filename": self.archive.name, "version": "1.2.3", "nolib": False}
        ]}))
        self.release = {"tag_name": "1.2.3", "draft": False, "id": 10}
        self.files = {1: self.archive.read_bytes(), 2: self.metadata.read_bytes()}
        self.assets = [
            {"name": path.name, "id": identifier, "state": "uploaded", "size": len(self.files[identifier])}
            for identifier, path in ((1, self.archive), (2, self.metadata))
        ]
        self.commands = []

    def run_gh(self, command, *, stdout, check):
        self.commands.append(command)
        endpoint = command[4]
        self.assertTrue(endpoint.startswith("repos/owner/repo/releases/"))
        self.assertTrue(check)
        if "/tags/" in endpoint:
            content = json.dumps(self.release).encode()
        elif endpoint.endswith("/10/assets"):
            self.assertIn("--paginate", command)
            self.assertIn("--slurp", command)
            content = json.dumps([self.assets[:1], self.assets[1:]]).encode()
        else:
            self.assertIn("Accept: application/octet-stream", command)
            content = self.files[int(endpoint.rsplit("/", 1)[1])]
        if stdout != subprocess.PIPE:
            stdout.write(content)
            content = None
        return subprocess.CompletedProcess(command, 0, stdout=content)

    def verify(self):
        with patch.object(release_assets.subprocess, "run", side_effect=self.run_gh):
            with patch("sys.stdout", new=io.StringIO()):
                release_assets.verify(str(self.archive), "1.2.3", "owner/repo")

    def test_success_with_paginated_assets(self):
        self.verify()
        self.assertEqual(len(self.commands), 4)

    def test_repeated_check_is_read_only(self):
        self.verify()
        self.verify()
        self.assertEqual(len(self.commands), 8)
        self.assertTrue(all(command[2:4] == ["--method", "GET"] for command in self.commands))

    def test_missing_archive_path(self):
        with self.assertRaisesRegex(ValueError, "archive path"):
            release_assets.verify("", "1.2.3", "owner/repo")

    def test_find_archive_uses_metadata_not_a_glob(self):
        (self.archive.parent / "unrelated.zip").write_bytes(b"old build")
        self.assertEqual(release_assets.find_archive(self.archive.parent, "1.2.3"), self.archive)

    def test_find_archive_rejects_wrong_tag(self):
        with self.assertRaisesRegex(ValueError, "exactly one ATT archive"):
            release_assets.find_archive(self.archive.parent, "1.2.4")

    def test_find_archive_rejects_ambiguous_archive(self):
        entry = {"filename": self.archive.name, "version": "1.2.3", "nolib": False}
        self.metadata.write_text(json.dumps({"releases": [entry, entry]}))
        with self.assertRaisesRegex(ValueError, "exactly one ATT archive"):
            release_assets.find_archive(self.archive.parent, "1.2.3")

    def test_find_archive_rejects_path_traversal(self):
        entry = {"filename": "../wrong.zip", "version": "1.2.3", "nolib": False}
        self.metadata.write_text(json.dumps({"releases": [entry]}))
        with self.assertRaisesRegex(ValueError, "invalid archive filename"):
            release_assets.find_archive(self.archive.parent, "1.2.3")

    def test_missing_local_metadata(self):
        self.metadata.unlink()
        with self.assertRaisesRegex(ValueError, "local asset"):
            self.verify()

    def test_invalid_local_zip(self):
        self.archive.write_bytes(b"truncated zip")
        with self.assertRaises(zipfile.BadZipFile):
            self.verify()

    def test_corrupt_local_zip_entry(self):
        contents = bytearray(self.archive.read_bytes())
        contents[contents.index(b"## Interface")] = ord("x")
        self.archive.write_bytes(contents)
        with self.assertRaisesRegex(ValueError, "corrupt local ZIP entry"):
            self.verify()

    def test_stale_local_metadata(self):
        self.metadata.write_text('{"releases":[{"filename":"old.zip","version":"1.2.3"}]}')
        with self.assertRaisesRegex(ValueError, "does not describe"):
            self.verify()

    def test_wrong_release_tag(self):
        self.release["tag_name"] = "old"
        with self.assertRaisesRegex(ValueError, "published GitHub release"):
            self.verify()

    def test_draft_release(self):
        self.release["draft"] = True
        with self.assertRaisesRegex(ValueError, "published GitHub release"):
            self.verify()

    def test_missing_asset_after_partial_upload(self):
        self.assets.pop()
        with self.assertRaisesRegex(ValueError, "expected one GitHub asset"):
            self.verify()

    def test_partial_upload_then_completed_recheck(self):
        metadata_asset = self.assets.pop()
        with self.assertRaisesRegex(ValueError, "expected one GitHub asset"):
            self.verify()
        self.assets.append(metadata_asset)
        self.verify()

    def test_wrong_asset_name(self):
        self.assets[0]["name"] = "wrong.zip"
        with self.assertRaisesRegex(ValueError, "expected one GitHub asset"):
            self.verify()

    def test_duplicate_asset_names(self):
        self.assets.append(dict(self.assets[0]))
        with self.assertRaisesRegex(ValueError, "expected one GitHub asset"):
            self.verify()

    def test_starter_asset_after_failed_upload(self):
        self.assets[0]["state"] = "starter"
        with self.assertRaisesRegex(ValueError, "incomplete GitHub asset"):
            self.verify()

    def test_incorrect_reported_size(self):
        self.assets[0]["size"] -= 1
        with self.assertRaisesRegex(ValueError, "incomplete GitHub asset"):
            self.verify()

    def test_truncated_download(self):
        self.files[1] = self.files[1][:-1]
        with self.assertRaisesRegex(ValueError, "wrong size"):
            self.verify()

    def test_same_size_wrong_download(self):
        self.files[1] = b"x" * len(self.files[1])
        with self.assertRaisesRegex(ValueError, "differs from local"):
            self.verify()

    def test_same_size_wrong_metadata_download(self):
        self.files[2] = b"x" * len(self.files[2])
        with self.assertRaisesRegex(ValueError, "differs from local"):
            self.verify()

    def test_expected_bytes_captured_before_api_calls(self):
        def change_local_file(command, **kwargs):
            contents = b"x" * len(self.files[1])
            self.archive.write_bytes(contents)
            self.files[1] = contents
            return self.run_gh(command, **kwargs)

        with patch.object(release_assets.subprocess, "run", side_effect=change_local_file):
            with self.assertRaisesRegex(ValueError, "differs from local"):
                release_assets.verify(str(self.archive), "1.2.3", "owner/repo")

    def test_api_failure_is_not_success(self):
        with patch.object(release_assets.subprocess, "run", side_effect=subprocess.CalledProcessError(1, "gh")):
            with self.assertRaises(subprocess.CalledProcessError):
                release_assets.verify(str(self.archive), "1.2.3", "owner/repo")

    def test_cli_returns_failure(self):
        arguments = ["verify-release-assets.py", "--archive", "", "--tag", "1.2.3", "--repository", "owner/repo"]
        with patch("sys.argv", arguments), patch("sys.stderr", new=io.StringIO()):
            self.assertEqual(release_assets.main(), 1)

    def test_cli_uses_release_directory_without_action_outputs(self):
        arguments = ["verify-release-assets.py", "--release-directory", self.directory.name,
                     "--tag", "1.2.3", "--repository", "owner/repo"]
        with patch("sys.argv", arguments), patch("sys.stdout", new=io.StringIO()):
            with patch.object(release_assets.subprocess, "run", side_effect=self.run_gh):
                self.assertEqual(release_assets.main(), 0)

    def test_cli_returns_failure_on_api_error(self):
        arguments = ["verify-release-assets.py", "--archive", str(self.archive),
                     "--tag", "1.2.3", "--repository", "owner/repo"]
        with patch("sys.argv", arguments), patch("sys.stderr", new=io.StringIO()):
            with patch.object(release_assets.subprocess, "run", side_effect=subprocess.CalledProcessError(1, "gh")):
                self.assertEqual(release_assets.main(), 1)


if __name__ == "__main__":
    unittest.main()
