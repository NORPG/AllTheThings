import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import tempfile
import unittest


spec = importlib.util.spec_from_file_location("release_state", Path(__file__).parents[1] / ".github/scripts/release-state.py")
state = importlib.util.module_from_spec(spec)
spec.loader.exec_module(state)
SHA = "a" * 40
REF = "refs/heads/master"
KEY = state.release_key(SHA, REF)


def step(name, conclusion="success", status="completed", started="2026-10-08T01:00:00Z"):
    return {"name": name, "conclusion": conclusion, "status": status, "started_at": started}


def job(steps, conclusion="success", attempt=1):
    return {"name": "release-linux", "steps": steps, "conclusion": conclusion, "run_attempt": attempt}


def run(number=1, sha=SHA, branch="master", event="schedule"):
    return {"id": number, "head_sha": sha, "head_branch": branch, "event": event}


class FakeGitHub(state.GitHub):
    def __init__(self, runs, jobs):
        self.runs = runs
        self.jobs = jobs
        self.calls = []

    def get(self, path, query):
        self.calls.append((path, query))
        if path.endswith("/runs"):
            items = self.runs
            if "head_sha" in query:
                items = [r for r in items if r["head_sha"] == query["head_sha"]]
            field = "workflow_runs"
        else:
            if query.get("filter") != "all":
                raise AssertionError("Previous attempts must be included")
            items = self.jobs[int(path.split("/")[-2])]
            field = "jobs"
        start = (query["page"] - 1) * query["per_page"]
        return {"total_count": len(items), field: items[start:start + query["per_page"]]}


class GuardTests(unittest.TestCase):
    def guard(self, api, sha=SHA, ref=REF):
        with contextlib.redirect_stdout(io.StringIO()):
            return state.guard(api, sha, ref)

    def test_first_attempt_is_allowed(self):
        self.assertTrue(self.guard(FakeGitHub([run()], {1: [job([
            step(state.INTENT_STEP + KEY, None, "pending", None),
            step(state.PACKAGE_STEP, None, "pending", None),
        ], None)]})))

    def test_parser_failure_can_be_rerun(self):
        self.assertTrue(self.guard(FakeGitHub([run()], {1: [{"name": "build-windows", "steps": [], "conclusion": "failure"}]})))

    def test_package_setup_failure_before_intent_can_be_rerun(self):
        self.assertTrue(self.guard(FakeGitHub([run()], {1: [job([
            step(state.INTENT_STEP + KEY, "skipped"),
            step(state.PACKAGE_STEP, "skipped"),
        ], "failure")]})))

    def test_successful_same_head_alpha_is_skipped(self):
        self.assertFalse(self.guard(FakeGitHub([run()], {1: [job([
            step(state.INTENT_STEP + KEY), step(state.PACKAGE_STEP)
        ])]})))

    def test_same_head_dispatch_is_skipped(self):
        self.assertFalse(self.guard(FakeGitHub([run(event="workflow_dispatch")], {1: [job([
            step(state.PACKAGE_STEP)
        ])]})))

    def test_new_head_can_publish(self):
        self.assertTrue(self.guard(FakeGitHub([run(sha="b" * 40)], {})))

    def test_partial_platform_failure_blocks_replay(self):
        with self.assertRaisesRegex(RuntimeError, "reconcile each platform"):
            self.guard(FakeGitHub([run()], {1: [job([
                step(state.INTENT_STEP + KEY), step(state.PACKAGE_STEP, "failure")
            ], "failure")]}))

    def test_cancelled_intent_blocks_replay(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: [job([
                step(state.INTENT_STEP + KEY, "cancelled"), step(state.PACKAGE_STEP, "skipped")
            ], "cancelled")]}))

    def test_unknown_timeout_blocks_replay(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: [job([
                step(state.INTENT_STEP + KEY), step(state.PACKAGE_STEP, None, "in_progress")
            ], None)]}))

    def test_earlier_attempt_in_same_run_is_not_hidden(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: [
                job([step(state.INTENT_STEP + KEY), step(state.PACKAGE_STEP, "failure")], "failure", 1),
                job([step(state.INTENT_STEP + KEY, None, "pending", None)], None, 2),
            ]}))

    def test_failed_earlier_attempt_blocks_even_with_success(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: [
                job([step(state.PACKAGE_STEP)], "success", 1),
                job([step(state.PACKAGE_STEP, "failure")], "failure", 2),
            ]}))

    def test_legacy_partial_publication_blocks(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: [job([
                step(state.PACKAGE_STEP, "failure")
            ], "failure")]}))

    def test_tag_replay_blocks_even_after_job_success(self):
        ref = "refs/tags/5.0.0"
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run(branch="5.0.0", event="push")], {1: [job([
                step(state.INTENT_STEP + state.release_key(SHA, ref)), step(state.PACKAGE_STEP)
            ])]}), ref=ref)

    def test_legacy_tag_replay_blocks(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run(branch="5.0.0", event="push")], {1: [job([
                step(state.PACKAGE_STEP)
            ])]}), ref="refs/tags/5.0.0")

    def test_moved_tag_does_not_bypass_guard(self):
        ref = "refs/tags/5.0.0"
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run(sha="b" * 40, branch="5.0.0", event="push")], {1: [job([
                step(state.INTENT_STEP + state.release_key("b" * 40, ref))
            ])]}), ref=ref)

    def test_distinct_tag_at_same_head_can_publish(self):
        self.assertTrue(self.guard(FakeGitHub([run(branch="5.0.0", event="push")], {}), ref="refs/tags/5.0.1"))

    def test_explicit_tag_intent_does_not_block_alpha(self):
        self.assertTrue(self.guard(FakeGitHub([run(event="workflow_dispatch")], {1: [job([
            step(state.INTENT_STEP + state.release_key(SHA, "refs/tags/5.0.0")), step(state.PACKAGE_STEP)
        ])]})))

    def test_null_branch_uses_exact_tag_intent(self):
        ref = "refs/tags/5.0.0"
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run(branch=None, event="push")], {1: [job([
                step(state.INTENT_STEP + state.release_key(SHA, ref))
            ])]}), ref=ref)

    def test_null_branch_legacy_publication_fails_closed(self):
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run(branch=None, event="push")], {1: [job([
                step(state.PACKAGE_STEP)
            ], "failure")]}), ref="refs/tags/5.0.0")

    def test_missing_job_steps_fails_closed(self):
        with self.assertRaises(KeyError):
            self.guard(FakeGitHub([run()], {1: [{"name": "release-linux", "status": "completed"}]}))

    def test_queued_job_without_steps_is_allowed(self):
        self.assertTrue(self.guard(FakeGitHub([run()], {1: [{"name": "release-linux", "status": "queued"}]})))

    def test_missing_step_status_fails_closed(self):
        with self.assertRaisesRegex(RuntimeError, "Incomplete publication step"):
            self.guard(FakeGitHub([run()], {1: [job([{"name": state.PACKAGE_STEP}])]}))

    def test_all_job_pages_are_checked(self):
        jobs = [{"name": "other", "steps": []}] * 100
        jobs.append(job([step(state.PACKAGE_STEP)], "failure"))
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub([run()], {1: jobs}))

    def test_all_run_pages_are_checked(self):
        runs = [run(n) for n in range(101)]
        jobs = {n: [] for n in range(101)}
        jobs[100] = [job([step(state.PACKAGE_STEP)], "failure")]
        with self.assertRaises(RuntimeError):
            self.guard(FakeGitHub(runs, jobs))

    def test_filtered_history_over_limit_fails_closed(self):
        with self.assertRaisesRegex(RuntimeError, "search limit"):
            self.guard(FakeGitHub([run(n) for n in range(1001)], {}))

    def test_incomplete_history_fails_closed(self):
        api = FakeGitHub([], {})
        api.get = lambda *_: {"workflow_runs": [], "total_count": 1}
        with self.assertRaisesRegex(RuntimeError, "Incomplete"):
            self.guard(api)

    def test_api_failure_does_not_allow_publish(self):
        api = FakeGitHub([], {})
        def failed(*_):
            raise OSError("API unavailable")
        api.get = failed
        with self.assertRaises(OSError):
            self.guard(api)


class SnapshotTests(unittest.TestCase):
    def test_failed_partial_publish_preserves_exact_bytes_and_digests(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            original = b"exact saved ZIP bytes"
            (directory / "ATT.zip").write_bytes(original)
            (directory / "release.json").write_text('{"releases": []}')
            evidence = directory / "release-evidence"
            state.snapshot(directory, evidence, {"ref": "refs/tags/5.0.0"}, "failure")
            self.assertEqual((evidence / "ATT.zip").read_bytes(), original)
            result = json.loads((evidence / "results.json").read_text())
            self.assertEqual(result["packager_outcome"], "failure")
            self.assertEqual(set(result["platforms"].values()), {"unverified"})
            self.assertTrue(result["final_zip_saved"])
            self.assertIn(hashlib.sha256(original).hexdigest() + "  ATT.zip", (evidence / "SHA256SUMS").read_text())

    def test_alpha_records_github_not_applicable(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            (directory / "ATT.zip").write_bytes(b"saved bytes")
            evidence = directory / "release-evidence"
            state.snapshot(directory, evidence, {"ref": REF}, "success")
            result = json.loads((evidence / "results.json").read_text())
            self.assertEqual(result["platforms"]["github"], "not-applicable")
            self.assertEqual(result["platforms"]["curseforge"], "unverified")

    def test_missing_zip_records_unknown_and_fails(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            evidence = directory / "release-evidence"
            with self.assertRaisesRegex(RuntimeError, "No final ZIP"):
                state.snapshot(directory, evidence, {"ref": REF}, "failure")
            result = json.loads((evidence / "results.json").read_text())
            self.assertFalse(result["final_zip_saved"])
            self.assertEqual(result["platforms"]["wago"], "unverified")


if __name__ == "__main__":
    unittest.main()
