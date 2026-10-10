# Complete AddOn deployment with system scripts

The script deployment path prepares a complete AddOn from an exact Git commit
and its verified public DB artifact. It stores immutable complete versions
outside the checkout and never writes generated DB files into the Git worktree.
Mac activation replaces an owned AddOns symlink after verifying both versions.

Deployment and its tests use operating system scripts. They do not require an
additional Python, Node, .NET 10 SDK, or a compiled ATT deployment executable.
The existing net48 Parser and official Actions' internal Node are separate
build and CI platform prerequisites.

## Mac prerequisites and use

Use macOS with system JXA (`osascript`), Foundation, Git, curl, unzip and shasum.
The scripts use system CommonCrypto for SHA-256 and native filesystem calls for
exclusive creation, native flock, fsync and atomic rename. `shasum` verifies the installed
script bundle before executing its JavaScript. This uses OS runtimes; it does
not remove the need for those system tools.

Choose an external store and a new AddOns target. Source, store and target must
not overlap. An existing AddOn or foreign store is preserved and refused.
Specify the artifact's exact flavor, profile and recipe; these are not inferred
from a filename or silently substituted.

```sh
/bin/sh .contrib/db-sync/att-deploy.sh configure \
  --source "$PWD" --store /absolute/external/att-store \
  --target /absolute/Interface/AddOns/AllTheThings \
  --flavor retail --profile new-cd-retail-auto --recipe new-cd-auto-v1
/bin/sh .contrib/db-sync/att-deploy.sh update --source "$PWD"
/bin/sh .contrib/db-sync/att-deploy.sh status --source "$PWD"
```

`update` prepares a version synchronously. `request` schedules preparation with
a latest request token. `--offline` uses only the existing cache, which is fully
reverified. Configuration normally lives in private Git metadata. `--config`
selects an explicit external configuration file.

Close the client and keep it closed for the complete activation transaction:

```sh
/bin/sh .contrib/db-sync/att-deploy.sh activate --source "$PWD" --client-closed
/bin/sh .contrib/db-sync/att-deploy.sh recover --source "$PWD"
```

Activation checks processes twice and refuses running or unknown results.
Process scanning is not a launch lease or a source mutex. Source/index changes,
newer requests, modified complete versions and an unknown target all stop the
transaction. Recovery inspects the actual pointer and durable journal. It
preserves owned abandoned stages for inspection rather than deleting evidence.

## Stage-only Git hooks

```sh
/bin/sh .contrib/db-sync/att-deploy.sh install-hooks --source "$PWD"
```

Installation uses a dedicated clone. Linked worktrees share Git configuration,
so automatic hook installation there is refused. Existing custom hooks and
modified repository hooks require manual integration. A literal trusted shell
bootstrap verifies the external bundle's exact inventory and every SHA-256
before any installed script runs.

Checkout, merge/pull, rewrite and commit hooks request preparation only. They
always let Git complete. Activation remains a separate command. Do not enable
the old Python bridge as part of this deployment path. `sync-db.sh` and
`sync-db.cmd` are thin dispatchers for the new scripts; the tracked legacy
`sync_db.py` remains available explicitly for its older workflow.

## Artifact and snapshot contract

Schema 2 requires `db-<object-format>-<full-commit>.zip`, `.sha256` and
`.metadata.json`. Metadata declares every file's SHA-256 and size, exact
flavor/profile/recipe products, product roots and load-closure files. The
consumer checks bounded HTTPS redirects, strict JSON, ZIP headers, entry types,
path collisions, sizes, CRC and the complete manifest/metadata/archive set
before accepting the files. It fully rechecks cache bytes on every use.

A complete version combines the exact Git archive runtime allowlist with the
selected product DB. Tracked, untracked or ignored source edits and hidden
index flags are refused. TOC and XML references, localization order and cycles
are verified with system XML parsing; source export attributes are preserved.

Historical public assets without schema 2 require an explicit local audit:
`--allow-local-audit --audited-contract PATH
--audited-contract-sha256 FULL_SHA256` when configuring. An audit certifies only
its declared scope and pinned bytes. It does not retrospectively establish an
unrecorded Parser profile. Audit/offline settings may be reconfigured under the
same owned paths and identity settings; the active version stays unchanged.

## Windows preparation

The Windows entry requires Windows PowerShell 5.1, existing .NET Framework
4.8/4.8.1, Git for Windows and the built-in CIM storage APIs. Managed paths must
use local physical NTFS volumes. It uses existing framework APIs, without
compiling an additional helper or installing a new runtime.

```powershell
powershell.exe -NoProfile -File .contrib\db-sync\att-deploy.ps1 `
  -Command prepare -Source C:\isolated\ATT -Store C:\external\att-store `
  -Target C:\fixture\AddOns\AllTheThings -Flavor retail `
  -Profile new-cd-retail-auto -Recipe new-cd-auto-v1
```

Windows activation is refused. Windows preparation and its native `selftest`
entry require execution on a Windows host before support can be claimed from
runtime evidence. This Mac implementation does not supply that evidence.

## New CD and packaging

`new-cd.ps1` collects exact source commits, exports a fresh source for each of
eight flavors, runs the existing net48 Parser, and generates schema 2 triples.
Parser source exports use pinned raw Git blobs, so repository archive attributes
cannot omit or substitute Parser inputs. Runtime exports honor Git archive
attributes independently.
The New CD workflow uses runner-provided PowerShell and trusted tools from the
PR base or workflow commit, separately from historical source commits. The
publisher validates the complete batch and existing assets before mutation.
It refuses conflicting, partial or legacy triples and never replaces their
bytes or deletes a release index.

`att-package.js` provides Mac JXA packaging for existing Parser output. Its
explicit init/export/complete/package steps pin source inputs and product
receipts. It does not run Parser or publish releases. See its `help` output for
arguments. A packager round trip verifies generated schema 2 with the consumer;
it does not prove Parser execution or Windows runtime compatibility.

## Tests

Run pure system-script fixtures with an external evidence directory:

```sh
/bin/sh .contrib/db-sync/test-script.sh /absolute/new/evidence-directory
```

For real public acceptance, first create a fresh dedicated clone at commit
`c182fc564f5467ae45e99482dc0267fcd8198fdb` and fetch
`4d45a8d74f1d5c5bf50b7489a128ce28432022ea`. Use the two separately audited,
hash-pinned historical contracts; the test rejects other contract bytes.

```sh
/bin/sh .contrib/db-sync/test-public-ab.sh \
  /absolute/fresh/clone /absolute/audit-A.json /absolute/audit-B.json \
  /absolute/new/acceptance-evidence --client-closed
```

This downloads into a new cache, activates only a fake AddOns target, performs
ordinary pull/checkout, verifies identity rejection and complete active
preservation, then compares source bytes with exact Git archives. The client
must remain closed. Logs, downloaded fixtures and reports belong outside the
worktree. Script results are independent of any earlier C# results.
