# Contributing to AllTheThings

This guide introduces the development workflow for AllTheThings (ATT): installing a development copy, finding and editing its source files, and opening issues and pull requests. It assumes that you already understand basic Git operations, including branches, commits, pull, and push.

The instructions and linked source files follow the current `master` branch. Older checkouts may use paths such as `.contrib/Parser/DATAS` instead of `.contrib/.db`; use the tools and paths from the version you are working on. Read [AGENTS.md](https://github.com/ATTWoWAddon/AllTheThings/blob/master/AGENTS.md) before contributing. Its guidelines are in effect even though the document is marked as a draft.

- [Get a development copy](#get-a-development-copy)
- [Generate the databases](#generate-the-databases)
- [Install and test in WoW](#install-and-test-in-wow)
- [Find and edit source files](#find-and-edit-source-files)
- [Report an issue](#report-an-issue)
- [Submit a pull request](#submit-a-pull-request)

## Get a development copy

For code or data contributions, fork [ATTWoWAddon/AllTheThings](https://github.com/ATTWoWAddon/AllTheThings) and clone your fork. Replace `YOUR-USERNAME` below with your GitHub username:

```sh
git clone https://github.com/YOUR-USERNAME/AllTheThings.git
cd AllTheThings
git remote add upstream https://github.com/ATTWoWAddon/AllTheThings.git
git fetch upstream
git switch -c my-change upstream/master
```

Keep unrelated work on separate branches or worktrees. Confirm the remote destinations with `git remote -v` before pushing. In this setup, `origin` is your fork and `upstream` is the ATT repository.

A source checkout needs generated databases under `db/` to load its content in WoW. Generate the databases for the clients you intend to test, or obtain matching build output as described below. Downloading a source ZIP does not run the Parser.

Record your branch and commit when reporting results from a Git installation:

```sh
git branch --show-current
git rev-parse HEAD
```

## Generate the databases

### Run the checked-in Parser

The current checked-in `.contrib/.tools/Parser.exe` is a Windows x64 program targeting .NET Framework 4.8. Keep it with its accompanying DLLs. For ordinary data changes, use this runner; rebuilding the C# solution is only needed when changing the tools themselves.

From the repository root, run the following in **Windows Command Prompt**:

```bat
cd .contrib\.tools
Parser.exe auto baseconfig="../.db/standard/.config/retail/retail.config"
```

This generates the Retail database. `auto` disables interactive waits, `baseconfig` selects the base configuration, and an additional `config` argument overlays it. For another flavour, append the argument from this table to the same command:

| WoW flavour | Additional argument | Generated directory |
| --- | --- | --- |
| Retail | None | `db/Standard/` |
| Classic Progression (MoP) | `config="../.db/standard/.config/classic/05 - Mists of Pandaria.config"` | `db/Mists/` |
| Classic Era | `config="../.db/standard/.config/classic/01 - Classic Era.config"` | `db/Vanilla/` |
| Classic Hardcore | The Classic Era argument; there is no separate Hardcore Parser configuration | `db/Vanilla/` |
| Classic Anniversary (TBC) | `config="../.db/standard/.config/classic/02 - TBC.config"` | `db/TBC/` |
| Season of Discovery | `config="../.db/standard/.config/classic/01 - Classic SOD.config"` | `db/VanillaSOD/` |
| Forever | `config="../.db/forever/.config/forever.config"` | `db/Camelot/` |

For example, the complete MoP command is:

```bat
Parser.exe auto baseconfig="../.db/standard/.config/retail/retail.config" config="../.db/standard/.config/classic/05 - Mists of Pandaria.config"
```

Classic Era's generated `Database.xml` also includes the SoD database. Era, Hardcore, and SoD clients use this loader, so generate and install both Era and SoD databases for any of those clients. Wrath and Cataclysm remain additional Parser targets. Retail PTR and Beta have their own configuration files under `.contrib/.db/standard/.config/retail/`; their output needs the installation layout described below. Follow the [Parser workflow](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.github/workflows/Parser.yml) and the [configuration files](https://github.com/ATTWoWAddon/AllTheThings/tree/master/.contrib/.db/standard/.config) for the exact targets in your checkout.

The Parser produces `ReferenceDB.lua`, `LocalizationDB.lua`, `Database.xml`, and category files. It recreates generated category directories, so edit the source data rather than making fixes in generated output. Review the Parser output and the entire working-tree diff afterward: generation can also update source-side exports or reference data. A successful parse does not prove that a drop, quest requirement, translation, or other game fact is correct.

### Build the tools from source

For C# changes, open [`.contrib/src/Parser/Parser.sln`](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/src/Parser/Parser.sln) in Visual Studio on Windows, restore NuGet dependencies, and build `Release` / `x64`.

The [Parser project](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/src/Parser/Parser.csproj) targets .NET Framework 4.8 and requires its targeting pack. The solution also includes [CSVCleaner](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/src/CSVCleaner/CSVCleaner.csproj), which targets .NET 8 and requires the corresponding SDK. Do not assume that the checked-in package directory contains every dependency; restore packages before building. Parser build output goes into `.contrib/.tools`, so inspect changes there as well as the C# diff.

The checked-in Windows executable does not run natively on macOS or Linux. Use a Windows environment for this Parser, or use available matching build output. State which environment and commands you actually tested when submitting tool changes.

### Use available build output

The regular Parser workflow uploads an Actions artifact named `db`. When using an artifact, check that its run corresponds to your intended commit and that it contains the required flavour directories. Keep the addon code and generated data from the same revision.

The optional [DB sync tools](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/db-sync/README.md) can retrieve checksum-verified databases for the exact current `HEAD` when a matching public asset or compatible Actions bundle is available. They require Python 3.8 or newer. The Actions fallback also requires installed, authenticated GitHub CLI (`gh`) and commit-named artifacts with checksums; download the regular workflow's plain `db` artifact manually. From the repository root:

```sh
# macOS or Linux
.contrib/db-sync/sync-db.sh
```

```bat
:: Windows Command Prompt
.contrib\db-sync\sync-db.cmd
```

Availability depends on the branch and workflow; there is no guarantee that every commit has a downloadable database. If no matching output exists, generate it locally. The sync tool replaces the local `db` directory after verification and refuses to overwrite local changes by default. A downloaded database cannot validate uncommitted source edits; regenerate after changing data.

## Install and test in WoW

1. Fully close WoW before installing or replacing ATT files. Updating an addon while the game is running can leave it in an inconsistent state.
2. Locate the intended client's `Interface/AddOns` directory. Common client directories include `_retail_`, `_classic_`, `_classic_era_`, and `_anniversary_`; PTR, Beta, and other installations may use different directories. Use the actual client you will test.
3. Move any existing `AllTheThings` addon folder outside `AddOns` as a backup. Place your development copy in `Interface/AddOns/AllTheThings`. The `.toc` file must be directly inside that folder, not inside another nested `AllTheThings` directory.
4. Include the root addon files (`AllTheThings.toc`, `AllTheThings.lua`, and `Bindings.xml`) and runtime directories `assets`, `lib`, `locales`, `src`, and `db`. Preserve their relative paths and include the generated databases needed by that client. See the [TOC](https://github.com/ATTWoWAddon/AllTheThings/blob/master/AllTheThings.toc) for the files loaded by ATT.
5. Start WoW, enable ATT, and reproduce the affected behaviour. Use `/att` to open ATT. Check the relevant collection, window, filters, and client language, and inspect any Lua errors.

For a Retail PTR or Beta installation, generate the corresponding configuration and copy the contents of `db/.ptr/` or `db/.beta/` into the installed addon's `db/Standard/`. This includes `Categories`, `Database.xml`, `LocalizationDB.lua`, and `ReferenceDB.lua`. The target client then loads the intended test database through the normal Standard paths, as implemented by the installation helpers.

If you install by copying files, copy your updated files again after editing or regenerating data. Keep your `WTF` saved variables separate from addon installation files; reinstalling source files does not require deleting your collection or settings data.

### Optional installation helpers

Review [Link ATT to WoW.bat](https://github.com/ATTWoWAddon/AllTheThings/blob/master/Link%20ATT%20to%20WoW.bat) or [Link ATT to WoW.sh](https://github.com/ATTWoWAddon/AllTheThings/blob/master/Link%20ATT%20to%20WoW.sh) before running it. Both remove existing installed `AllTheThings` directories in the client folders they find. Back up those addon folders and check the target paths first.

- The Windows helper looks for a WoW root and then tries several predefined locations. For normal clients it creates directory junctions to the checkout. PTR/Beta handling is separate; inspect its requirements and output.
- The macOS helper uses `/Applications/World of Warcraft` and the current working directory as its source. Run it from the repository root. It installs through `rsync` copies/hard links rather than a single directory symlink, and currently does not include `_anniversary_`. Re-run installation as needed after source changes and use a manual installation for a client it does not cover.

Never assume that a helper's completion message proves that it found your client or installed all required databases. Check the resulting addon folder and test the actual client.

## Find and edit source files

Open the repository root in your editor so that its configuration and relative paths are available. The repository includes [VS Code configuration and tasks](https://github.com/ATTWoWAddon/AllTheThings/tree/master/.vscode); use the Lua language tooling available in your editor to inspect definitions and diagnostics.

| Location on current master | Purpose |
| --- | --- |
| `src/`, `lib/` | Addon behaviour, classes, windows, and shared runtime helpers |
| `locales/Default Locale.lua` | Runtime locale defaults and remaining direct locale overrides |
| `.contrib/.db/standard/` | Standard WoW content source data |
| `.contrib/.db/forever/` | Forever content source data |
| `.contrib/.db/shared/` | Shared functions, definitions, localization, and data |
| `.contrib/src/Parser/`, `.contrib/src/CSVCleaner/` | C# developer tools |
| `.contrib/.tools/` | Tool executables and Lua utilities |
| `db/` | Generated runtime databases |
| `docs/`, `.github/` | Documentation, issue forms, and workflows |

Follow the surrounding code and the repository's [`.editorconfig`](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.editorconfig) and [`.gitattributes`](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.gitattributes). Lua files use tabs and CRLF line endings. Avoid changing unrelated formatting or generated files merely because an editor rewrote them.

### Data changes and source evidence

Search for the affected item, quest, achievement, NPC, or object ID before adding a new record. Edit its owning source record and follow nearby examples. Helpers such as `q(ID, {...})` and `i(ID, {...})` are defined in [Shortcuts.lua](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/.db/shared/functions/Shortcuts.lua). Preserve existing timeline conditions, flavour tags, source quests, coordinates, and faction/class restrictions unless your evidence supports changing them.

Every data addition, correction, or removal must have at least one of the sources required by `AGENTS.md`: an in-game screenshot, an ATT Contribute export (**Contributor Report**), or a Wowhead source. In the issue or PR:

- Attach the evidence or link to an accessible attachment. For Wowhead, link directly to the relevant page.
- Identify the affected IDs and explain which source supports each correction or group of corrections.
- Include the WoW flavour and client build, ATT version, and relevant region, event, location, or observation date.
- If the evidence is on a related issue, link the issue and identify the relevant attachment or report.

AI-generated explanations and inferred values do not replace source evidence. Mark unsupported changes as unverified in a draft and obtain evidence before presenting them as ready for review.

To collect a Contributor Report:

1. Run `/att contribute` to enable extra contribution reporting.
2. Inspect or reproduce the affected content. When ATT produces a **Contributor Report** link in chat, click it.
3. Copy the complete multiline report from the dialog using `CTRL+C` and attach it to the issue or PR.
4. Explain the affected IDs and corrections. Reports include ATT/client version, location, and timestamp context; add the flavour and any other context needed to interpret the observation.
5. Run `/att contribute` again to disable extra reporting. If you need to generate a previously reported entry again in the same session, use `/att report-reset`.

Generate the affected databases after editing and inspect the result in game. Shared-source changes can affect several flavours; validate those affected outputs as well as your own client.

### Localization changes

Search for the existing text or `L.KEY` to find the owning source. UI strings commonly live in [`.contrib/.db/shared/lib/Strings/`](https://github.com/ATTWoWAddon/AllTheThings/tree/master/.contrib/.db/shared/lib/Strings) as `createLocalizationString` definitions. Headers live in [`.contrib/.db/shared/lib/Headers/`](https://github.com/ATTWoWAddon/AllTheThings/tree/master/.contrib/.db/shared/lib/Headers), and object names in [ObjectDB.lua](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/.db/shared/objects/ObjectDB.lua). Some runtime defaults remain in [Default Locale.lua](https://github.com/ATTWoWAddon/AllTheThings/blob/master/locales/Default%20Locale.lua).

Preserve English fallback text, localization constants, formatting placeholders such as `%s` and `%d`, WoW markup, and programmatic expressions. Do not introduce duplicate localization constants. The shared localization tables use these keys:

| Client locale | Table key | Client locale | Table key |
| --- | --- | --- | --- |
| `enUS` | `en` | `deDE` | `de` |
| `esES` | `es` | `esMX` | `mx` |
| `frFR` | `fr` | `itIT` | `it` |
| `koKR` | `ko` | `ptBR` | `pt` |
| `ruRU` | `ru` | `zhCN` | `cn` |
| `zhTW` | `tw` | | |

The optional [Lua table normalizer](https://github.com/ATTWoWAddon/AllTheThings/blob/master/.contrib/.tools/README.md) requires Node.js. Run it from the repository root on the selected source file:

```sh
node .contrib/.tools/Lua/normalize.js "path/to/source.lua"
```

VS Code also provides a **Normalize Lua Table** task. The tool edits files in place; review its entire diff, since unrecognized content inside matched tables may be removed. Regenerate the affected databases and check the text in the target client language, including wrapping, placeholders, and fallback behaviour. Fix source definitions rather than generated `db/*/LocalizationDB.lua` files.

### Check your changes

Before submitting, review the scope and whitespace:

```sh
git status --short
git diff --stat
git diff
git diff --check
```

For data/localization changes, run the Parser for the affected configurations and inspect the in-game result. For runtime changes, reproduce the original problem and test the resulting behaviour in the relevant client and settings. For tool changes, build and run the changed tool with representative input. Documentation changes need accurate links, paths, and commands.

In your PR, state the commands, configurations, client/build, language, and checks you actually used. Separate successful checks from checks you could not perform. Parser success, editor diagnostics, and in-game testing establish different things; report them accurately.

## Report an issue

Search the [existing issues](https://github.com/ATTWoWAddon/AllTheThings/issues) first. If a problem appeared immediately after updating ATT, fully close and reopen WoW before checking again, as described in the [README](https://github.com/ATTWoWAddon/AllTheThings#problem-suggestion).

Open the [issue chooser](https://github.com/ATTWoWAddon/AllTheThings/issues/new/choose) and select the appropriate form:

- **Bug Report:** describe the expected and actual behaviour, reproduction steps or intermittent conditions, and relevant character/location/settings. Say whether ATT fails to load, a particular module fails, or performance is reduced. Include the complete Lua error and stack trace if available, using BugSack or `/console scriptErrors 1`.
- **Data Discrepancy Report:** identify the affected IDs, current ATT data, expected correction, and source evidence. Include the context required to interpret it.
- **Feature Request:** explain the problem or use case, proposed behaviour, how it would be used, and relevant alternatives. Discussion helps establish the intended behaviour before implementation.

Use the form's current flavour choices: Retail, Classic Progression (MoP), Classic Era, Classic Hardcore, Classic Anniversary (TBC), Season of Discovery, Forever, or Other / Unsure. Feature Request also offers **All Flavors / Cross-Flavor** and allows multiple selections. Specify Live, PTR, or Beta separately. Include region, event/game mode, and client language when relevant.

For bug and data reports, provide the client version/build from `/dump GetBuildInfo()`, the ATT release channel, and the exact ATT version from `/dump ATTC.Version` or addon information. For historical data sources, give the relevant historical build/context if known, or state that it is **unknown**. A Git install may report `[Git]`; include its branch and commit SHA. Describe ATT mode/filters and other addons where relevant. If you have not tested with only ATT enabled, say **Not tested**.

If AI helped with the related work or the issue's content, add an `AI Assistance` section in **Additional Context** or the equivalent free-text field. Name the actual model(s), explain what they helped with, and describe verification accurately:

```markdown
## AI Assistance
AI assistance was used with [actual model name(s)] for [specific tasks].
[Describe the verification performed and any limitations.]
```

For general questions, the project's [Discord](https://discord.gg/allthethings) is also linked from the README and issue chooser.

## Submit a pull request

Keep the change focused and review the complete diff before committing. Link related issues when applicable and attach the evidence for any data changes. Push your branch to your fork and open a PR against the ATT repository's `master` branch.

Follow the commit requirements in `AGENTS.md`:

- Use `[Category] Summary.` for the subject, with a capitalized category and a final period.
- Keep the complete subject at 50 characters or fewer.
- Describe the detailed changes in a body separated from the subject by a blank line.
- For AI-assisted work, add an `Assisted-by: <actual model name>` trailer for each model that contributed. Confirm the model name before committing if it is unknown. Preserve attribution when amending or squashing.

For example, an AI-assisted documentation commit could use this structure, with the placeholder replaced by the actual model:

```text
[Docs] Complete contribution guide.

Document development installation, source editing, and contribution requirements.

Assisted-by: <actual model name>
```

Keep the complete PR title at 45 characters or fewer. Every PR requires **Summary** and **AI Assistance** sections. Add **Feature Introduction** for a new feature and **Data Sources** for any data changes. A validation section makes your checks and remaining limitations easy to assess:

```markdown
## Summary
- [Purpose and resulting changes]

## Feature Introduction
[For a new feature: purpose, usage, expected behaviour, and limitations.]
[Omit this section if no new feature is introduced.]

## Data Sources
- [Affected IDs, evidence attachment/link or direct Wowhead page, and version/context]
[Omit this section if no ATT data changes.]

## Validation
- [Commands/configurations and in-game checks actually performed]
- [Checks not performed and any relevant limitations]

## AI Assistance
AI assistance was used with [actual model name(s)] for [specific tasks].
[If no AI was used, replace this with: No AI assistance was used for this contribution.]
```

Do not claim human review, testing, or source verification that did not occur. Respond to review feedback with the relevant code, data evidence, or test results, and update the PR description when the change's scope or validation changes.
