# Issue form labels

`Issue_Form_Labels.yml` adds existing labels for exact selections in the current
bug, data, and feature forms, on issue creation or edits. It does not guess from
free text, replace labels, backfill issues, or add issues to Projects. Forms
already set their `type:*` label; the workflow leaves that label alone.
Missing or ambiguous form type labels cause it to skip the issue.

| WoW Flavor choice | Label |
| --- | --- |
| Retail | `flavor:retail` |
| Classic Progression (MoP) | `flavor:progression` |
| Classic Era | `flavor:era` |
| Classic Hardcore | `flavor:hardcore` |
| Classic Anniversary (TBC) | `flavor:anniversary` |
| Season of Discovery | `flavor:sod` |
| Forever | `flavor:forever` |
| All Flavors / Cross-Flavor | `flavor:all`, only when explicitly selected |
| Other / Unsure | None |

The split Classic selections use distinct labels. The workflow checks the
repository's labels at runtime and warns/skips missing names;
it does not create labels or fall back to `flavor:classic`.

Data Categories map directly to the existing `db:items`, `db:quests`,
`db:achievements`, `db:creatures` (Creatures / NPCs), `db:objects`, `db:spells`,
`db:mounts`, `db:pets`, `db:decor`, `db:warband-campsites`, and `db:professions`.
Illusions, Appearances, Drop sources, and Other / Unsure add no database label.
Multiple explicit selections add their individual labels, including when All
Flavors is selected alongside another flavor.

Edits are additive. Changing Retail to Classic Era adds `flavor:era` if that label
exists and retains `flavor:retail`. Maintainers remove obsolete labels manually;
the workflow does not claim ownership of existing or manual labels. Re-running
the workflow skips labels already assigned.

The parser accepts the exact ordered form headings, single-line dropdown
answers, comma-separated multi-select answers, and empty optional answers.
Unknown answers, duplicate/missing/reordered headings, malformed selections,
and unclosed code fences cause it to skip the issue. Headings inside closed code
fences are ignored. Extra H3 headings in free-text answers also skip the issue;
use another heading level if automatic labeling is desired. GitHub converts
forms into editable Markdown, so this check cannot authenticate form origin;
an identical manually written layout is indistinguishable from a form.

The workflow runs only for `opened`/`edited` issues in ATTWoWAddon/AllTheThings.
Official actions are pinned to release commit SHAs. Checkout uses the trusted
issue event's default-branch SHA, with credentials disabled. `contents:read`
reads this reviewed module; `issues:write` adds labels. Issue text is passed as
data from the API and is never interpolated into executable code or shell.

Run local tests without installing packages:

```sh
node --test .github/scripts/tests/issue-form-labels.test.cjs
```

References: [GitHub issue-form syntax](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms),
[GitHub-owned dropdown parser](https://github.com/github/issue-parser#dropdown-selections),
[issue event SHA](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#issues),
and [github-script input safety](https://github.com/actions/github-script#passing-inputs-to-the-script).
