# Release replay and recovery

Release checks all attempts of prior Release jobs before publishing. A successful
alpha job at the same HEAD causes a clean skip; this records prior job success,
not verified platform success. A tagged replay or any failed, cancelled, or
unfinished publication intent fails closed. Parser failures before publication
intent can be rerun normally. Missing or ambiguous job metadata, incomplete
history, and API failures also block publication. The existing release concurrency group serializes
these checks and publication.

Before invoking the packager, the workflow saves `publish-intent.json` as an
immutable artifact. Afterwards, including packager failures, it saves the final
ZIP files, available `release.json`, SHA256 digests, and `results.json` in a
separate artifact. Names include the run ID and attempt; no earlier artifact is
overwritten. Artifacts are retained for 90 days. The guard also checks job history
after an artifact expires. Retain that history: deleting workflow runs removes
the replay protection. Rerunning a workflow revision from before this guard was
added also bypasses it, because GitHub reruns the original revision.

The packager does not expose individual platform responses. All configured
platform results are recorded as `unverified`; GitHub is `not-applicable` for an
untagged alpha. A successful packager exit is not proof that every platform has
the correct asset. Runner termination during the packager can prevent saving
the final ZIP, but its prior intent still blocks automatic replay. The packager
also retries upload requests internally; a lost response after remote acceptance
can duplicate an upload within the first attempt. This guard only prevents
another workflow attempt from repeating an uncertain publication.

For recovery, download the intent and result artifacts from the original run.
Verify the saved files with `sha256sum -c SHA256SUMS`. Inspect CurseForge, Wago,
and (for a tag) GitHub for the actual files and record which platforms accepted
them. Upload only a confirmed missing file using the saved ZIP and the platform's
manual upload interface; do not rebuild it or rerun Release to recover. If the ZIP
is unavailable or remote acceptance is ambiguous, resolve that ambiguity before
publishing anything further. Keep the saved evidence and platform reconciliation
with the release record.

Automatic selective resume and guaranteed ZIP retention before any platform
request require separating packaging from the packager's uploader. Its `-z`
option also skips archive variable initialization and cannot upload a saved ZIP.
That larger change is deliberately deferred by this bounded guard.
