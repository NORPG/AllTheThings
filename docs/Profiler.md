# ATT Performance Profiler

ATT's performance profiler records short captures of explicitly instrumented work to help investigate refresh costs and stutter. It is disabled by default. Start it only for the action you want to measure, then copy the report for comparison or an issue report.

This feature is submitted as a Draft while in-game validation is pending. The measurements and commands below describe the implementation; availability of Blizzard's optional profiler metrics depends on the client and its current profiler state.

## Capture and copy a report

1. Log in and wait for ATT's initial loading and collection refresh to settle.
2. Run `/att profile start 30` immediately before the action that causes the problem. `/att profile start` uses the same 30-second default.
3. Reproduce the action, such as changing ATT's collection mode or refreshing collections. Keep the other actions during the capture consistent between tests.
4. After the work finishes, run `/att profile stop`, or wait for the automatic stop message.
5. Run `/att profile report`. The **ATT Performance Profile** popup opens with its report text selected. Use the platform's copy shortcut, such as Ctrl+C, and paste it into a text file or issue comment.
6. Save the report and the test context before starting another capture. A new capture replaces the previous one.

The report uses tab-separated columns, so copied timing and counter rows can also be pasted into a spreadsheet. Report text is copied locally; ATT does not upload it.

## Commands

| Command | Behavior |
| --- | --- |
| `/att profile` or `/att profile help` | Prints command usage. |
| `/att profile start [seconds] [level] [key=value ...]` | Clears the previous capture and starts recording. Defaults to 30 seconds and Level 1. Accepts 1–300 seconds, including fractions, and levels 1–6 or their names. |
| `/att profile nextlogin [seconds] [level] [key=value ...]` | Saves a one-shot request with its level and options for the next login or UI reload; leaves the current capture and report intact. |
| `/att profile nextlogin cancel` | Removes the pending login request without changing the current capture. |
| `/att profile stop` | Stops recording and keeps the captured results available. Reports that no capture is running if already stopped. |
| `/att profile report` | Opens a copyable report. During a capture, it shows a snapshot and recording continues. Run it again to see later results. |
| `/att profile reset` | Stops recording and clears all captured results. |

Invalid durations, levels, filters, or options are rejected without replacing the active capture or pending login request. Duration and level precede named options; duplicate or unknown options are rejected. A timer stops a valid capture automatically. Because WoW runs the callback when Lua execution permits it, a long synchronous operation can make the actual elapsed time exceed the requested duration.

## Capture levels

Levels select cumulative diagnostic capabilities. Overview measurements remain global; include/exclude filters select the modules whose additional details are recorded. The selected policy stays fixed for the session. Start a new capture to change it.

| Level | Name | Added information | Main cost |
| --- | --- | --- | --- |
| 1 | `overview` | Existing Runner/Transmog/event metrics, coroutine resumes, and major startup, collection, costs, cache, search, tooltip, and window boundaries. | Clock reads and aggregate updates at coarse boundaries. |
| 2 | `components` | Event handler and Runner work segments, plus instrumented module phases. | More timing boundaries; nested durations overlap. |
| 3 | `workload` | Batched work counts, cache routes/hits/misses, actual handler invocations, and coalesced requests. | Counting work and submitting aggregates; loop counters are accumulated locally where possible. |
| 4 | `jobs` | Bounded queue-job records with source context, observed queue wait, execution fragments, resumes, and completion/cancellation/failure state. | Job metadata and coroutine-local lifecycle tracking. |
| 5 | `timeline` | A bounded time-ordered ring of job lifecycle events and operations exceeding the slow threshold. | Extra record storage and lifecycle timestamps. |
| 6 | `diagnostics` | Periodically sampled Transmog API and cost item-count call sites, with optional bounded caller stacks. | Selected hot-call instrumentation and optional stack capture. |

Recording disabled is Level 0; use `stop` or `reset`. Level 0 is not a valid start level. Levels 4–6 require an explicit `include`, including `include=all`, to make the detail range visible. An explicit exclusion removes module details while retaining its Overview scopes.

Examples:

```text
/att profile start 30 2
/att profile start 30 workload include=costs,search
/att profile start 10 jobs include=events,costs jobs=128
/att profile start 10 timeline include=events,costs slow=10 records=256
/att profile start 10 diagnostics include=transmog sample=10
/att profile nextlogin 30 5 include=events,startup
```

### Capture options

| Option | Default and accepted values | Effect |
| --- | --- | --- |
| `include` | `all` at Levels 1–3; required at Levels 4–6. | Comma-separated detail modules, or `all`. |
| `exclude` | None; comma-separated modules or `all`. | Omits selected module details; Overview remains global. |
| `sample` | 10; integer 1–10000. | Level 6 records the first call and every Nth subsequent call per diagnostic scope. Lower-level aggregates remain complete within their selected scope coverage. |
| `slow` | 10; finite nonnegative milliseconds. | Retains completed timing samples at or above this threshold in the timeline. Job lifecycle events are independent of this threshold. |
| `metrics` | 128; integer 0–1024. | Maximum distinct detail metric IDs; Overview has its separate 64-ID allowance. |
| `jobs` | 128; integer 0–1024. | Maximum retained job records per capture. |
| `records` | 256; integer 0–4096. | Timeline ring capacity; oldest entries are overwritten when full. |
| `stacks` | `false`; `true` or `false`. | Retains caller context for accepted Level 6 timing samples when `debugstack` is available. |
| `stackbytes` | 8192; integer 0–65536. | Retained stack-text byte limit, also bounded by 128 stack records. |

Built-in module names are `runner`, `events`, `startup`, `collection`, `transmog`, `costs`, `search`, `tooltip`, `windows`, `cache`, `inventory`, and `upgrade`. Registered scopes can add module names. A module can have coarse scopes without additional phase/API instrumentation; selecting it does not create automatic tracing of its functions. Zero capacities disable retention for that data kind and do not stop the capture.

Sampling decisions occur before diagnostic clock reads and stack capture. Sampled rows appear in a separate report section, and their totals, sample counts, units, and p95 describe observed samples only. They are not extrapolated full-workload values. Periodic sampling may miss rare calls or align with a repeated workload pattern.

Caller stacks are captured at the selected call site's beginning. They identify the caller context, not the called function's later internal execution, and are not arbitrary Lua CPU sampling. Stack collection is excluded from that diagnostic scope's own elapsed duration; enclosing scopes can still include instrumentation overhead.

### Choose depth and scope

Start with Level 1 or 2 to find an expensive subsystem, then use Level 3 to distinguish increased work from increased unit cost. Use short Level 4–6 captures for the identified module. For example, a high `runner.costs.slice` total can be followed by costs phase timings, queued-job origins, and sampled `costs.api.itemcount` calls.

Overhead follows the number of observed calls, jobs, clock reads, and stored records rather than the number of available levels. A narrowly selected deep capture can be cheaper than a broad lower-level capture. A slow threshold reduces saved records, but eligible operations still need timing to determine whether they are slow. A record budget limits storage and does not remove all observation cost.

Compare changes with the same level, scope, sampling, capacities, and workload. Compare profiling disabled and enabled separately to assess observer overhead. No fixed overhead percentage or FPS improvement has been measured in the intended clients.

Results exist only in memory for the current UI session. Starting another capture, resetting, reloading the UI, or logging out discards them. There is no SavedVariables history or automatic file export. A manual capture started with `/att profile start` cannot measure startup work that finished before the command became available.

## Capture the next login

1. Run `/att profile nextlogin 60` before logging out, or before reloading the UI. Omit the duration to use 30 seconds.
2. Log back in with ATT enabled, or run `/reload`. ATT starts the capture at the beginning of its `PLAYER_LOGIN` handler, before settings initialization and the initial collection refresh.
3. Wait for the automatic stop message, or use `/att profile stop` after the work you want to measure finishes.
4. Run `/att profile report` and copy the results before logging out, reloading, or starting another capture.

The request is stored in ATT's existing account-wide SavedVariables. The next character login that loads ATT consumes it; it is not tied to an ATT settings profile or to the character that scheduled it. Each request runs once, and must be scheduled again for another login capture. A new valid request replaces its duration, level, and options. Invalid input leaves both the pending request and the current capture unchanged. Legacy duration-only requests start at Level 1.

Use `/att profile nextlogin cancel` to cancel a request. Manual `start`, `stop`, and `reset` commands affect the current capture only; they leave the pending login request in place. Only the validated request configuration is saved. Timing samples and reports are still discarded on logout or UI reload.

Login captures measure the same instrumented scopes as manual captures. They begin at `PLAYER_LOGIN`, so earlier addon-file execution and database-file loading are outside the capture. Slow synchronous startup work can delay the automatic stop callback and extend elapsed time; use a longer duration if progressive loading or collection refresh continues after the capture stops. Login and UI-reload behavior still require validation in the intended clients.

## Read the report

The header identifies the capture session, running/stopped state, duration and stop reason, selected level, detail modules, exclusions, capacities, and diagnostic sampling coverage. Timing rows are sorted by accumulated time, highest first. Counter rows are sorted by their IDs.

| Column | Meaning |
| --- | --- |
| Timing ID | The instrumented scope being measured. |
| Calls | Number of recorded timing samples for that scope. It is not necessarily the number of tasks, events, or game frames. |
| Total ms | Sum of that scope's measured durations during the capture. |
| Avg ms | Total divided by Calls. |
| Max ms | Longest recorded sample. |
| p95 bucket ms | Histogram bucket containing the 95th-percentile sample, shown as an upper bound rather than an exact percentile. |
| Units | Sum of work counts supplied with accepted samples. A dash means no work count was supplied for those samples. |

The histogram has upper bounds of 0.25, 0.5, 1, 2, 4, 8, 16, 33, 66, 100, 250, 500, and 1000 ms, followed by an overflow bucket. For example, `<=16.00` means the sample at the 95th-percentile position falls in a bucket ending at 16 ms. `>1000` means it falls in the overflow bucket. Small captures may have too few samples for p95 to describe typical behavior well.

High Total can indicate frequent work even when individual samples are short. High Max or p95 can indicate long individual execution slices. Compare Calls and event counts as well as timings: two captures with different workloads can have different totals without a change in the cost of a single operation.

### Instrumented scope coverage

The following groups describe actual call sites in this implementation. Levels and module filters enable existing scope boundaries; they do not automatically trace every function or API in a selected module. Timing IDs can be absent when their paths did not run, tracking was disabled, or a client does not provide the functionality ATT uses.

| Group | Overview timings (Level 1) | Additional scoped measurements | Meaning and limits |
| --- | --- | --- | --- |
| Runner and coroutines | `runner.<name>.slice`, `coroutine.slice` | Level 2: `runner.<name>.work`, `coroutine.work`, or an explicitly assigned work label. Level 3: `runner.<name>.calls`. | Slice timings cover one resume. Work timings cover execution segments of queued functions or pooled coroutines; between-frame waits are excluded. A single invocation that yields can produce several timing samples. |
| ATT custom events | `event.trigger.OnRecalculate`, `event.trigger.OnRefreshCollections`, and `event.trigger.OnSourcesCollected` are counters. | Level 2: `event.handler.<event>[.<label>]`. Level 3: matching `.calls`, plus `event.accepted.<event>` and `event.coalesced.<event>` for the three overview events. | Handler scopes aggregate by event unless an explicit stable label is supplied. Immediate events have stage timing and invocation counts, without a separate queued-job lifecycle. |
| Startup | `startup.savedvariables`, `startup.settings` | No additional startup-specific phase or API scopes. | Saved-variable initialization and settings initialization during `PLAYER_LOGIN`; earlier addon/database-file loading is outside capture. |
| Collection state batches | `collection.batch` | Level 2: `collection.batch.changed`. Level 3: `collection.batch.ids`, `collection.batch.changes`. | Account/character collection-state batches; work counts describe IDs visited and character-state changes, rather than all collection-refresh activity. |
| Transmog | `transmog.sources.scan`, `transmog.unique.collect` | Level 2: `transmog.unique.known`, `transmog.unique.broken`. Level 3: `transmog.sources.known`, `transmog.unique.expanded`. Level 6: `transmog.api.known`, `transmog.api.sourceinfo`. | Ownership scans, Unique expansion, and broken-source processing. API samples cover ownership calls in scans and source-info calls in broken Unique processing; other Transmog API call sites are outside those diagnostic scopes. |
| Costs | `costs.queue` | Level 2: `costs.assign.item`, `costs.assign.currency`, `costs.assign.spell`. Level 3: `costs.queue.jobs`, `costs.refs`, `costs.groups`. Level 6: `costs.api.itemcount`. | Queue construction is separate from later Runner execution. Work counts describe scheduled jobs/references and assigned groups. Item-count samples cover the instrumented ATT cost ownership queries. |
| Field caches | `cache.search` | Level 3: `cache.lookups`, `cache.hits`, `cache.misses`. | Searches across established field caches. A hit means a field/ID lookup returned at least one group; these are not measurements of every ATT cache. |
| Search hierarchy | `search.build` | Level 2: `search.candidates`, `search.filter`. Level 3: `search.route.cache`, `search.route.recursive`, `search.results`. | Candidate discovery/cloning and final filtering for targeted hierarchy searches. Results count top-level returned groups, not every descendant. |
| Tooltip | `tooltip.attach` | Level 2: `tooltip.search`, `tooltip.info`. Level 3: `tooltip.cache.hits`, `tooltip.cache.misses`. | ATT attachment, result retrieval, and information rendering at the instrumented tooltip entry point. Cache counters concern tooltip information for a group; other tooltip update paths can remain unobserved. |
| Windows | `window.update`, `window.redraw` | Level 2: `window.update.groups`. Level 3: `window.rows`. | Data/progress updates and visible-row rendering. Units distinguish flattened update rows from visible rows actually rendered. |

`<name>` is a stable Runner category. Named built-in Runners use their category; window Runners share `windows`, and unrecognized names share `other`. Dynamic window names, coroutine deduplication keys, item IDs, and function addresses are not used to create distinct Runner metric IDs. A Runner work scope can belong to `costs`, `events`, `windows`, or another registered module even though its coarse slice is part of the global `runner` summary.

Level 2 timing **Calls** counts accepted execution segments. Level 3 `runner.<name>.calls` and `event.handler.<event>[.<label>].calls` count actual function entries, excluding subsequent resumes of the same invocation. When a queued function has an explicit invocation counter, that counter is used instead of the Runner's fallback `.calls` counter. The Runner counter excludes those labeled invocations, while a handler counter can also include immediate dispatches; compare each ID within its own coverage.

Work units depend on the scope. `transmog.sources.scan`, `transmog.unique.collect`, and `transmog.unique.known` supply the source-ID scan bound, `app.MaxSourceID`; that range is not the number of appearances known or unlocked. `transmog.unique.broken` supplies broken entries visited. Collection batches, costs queue construction, and field-cache searches submit additional work units when their Level 3 workload tracking is enabled; a lower-level timing row can therefore show `-` even though that scope supports units.

Runner, handler, module, and API scopes can overlap. For example, a Runner slice can contain an event handler and its Transmog source scan, or a Unique calculation with its known/broken phases and sampled API calls. The source scan and Unique rebuild are separate event paths; the Unique timing does not contain the source-scan timing. Their times must not be added together to estimate total ATT time. These are inclusive elapsed measurements of observed boundaries, rather than an exhaustive or exclusive accounting of all ATT execution.

### Event counters

| Counter ID | Minimum level | What it counts |
| --- | --- | --- |
| `event.trigger.OnRecalculate` | 1 | Dispatch requests for `OnRecalculate`, including requests later coalesced. |
| `event.trigger.OnRefreshCollections` | 1 | Dispatch requests for `OnRefreshCollections`, including requests later coalesced. |
| `event.trigger.OnSourcesCollected` | 1 | Dispatch requests for `OnSourcesCollected`, including requests later coalesced. |
| `event.accepted.<event>` | 3 | Dispatches accepted by ATT's dispatcher for those same three events, after checking whether a queued dispatch already exists. |
| `event.coalesced.<event>` | 3 | Requests for those three events suppressed because that event is already queued. |
| `event.handler.<event>[.<label>].calls` | 3 | Actual invocations of the corresponding handler group, counted once at entry rather than once per resume. |

Request and accepted counts do not prove that handlers completed successfully. An accepted event can invoke several handlers, while a handler that yields contributes multiple timing segments but only one invocation. Immediate dispatches do not use the queued-event coalescing path. The counters do not count every WoW event or every refresh category. Compare matching IDs under the same detail filters and capacities; dropped metrics or a capture boundary can make the visible counts incomplete.

### Jobs (Level 4 and above)

Job records observe functions queued through ATT's instrumented Runners and pooled `StartCoroutine` work. They use coroutine-local context to relate a newly enqueued job to an observed parent. Records are sorted by observed execution time in the report.

| Column | Meaning |
| --- | --- |
| Job | Capture-local record ID; it has no meaning in another capture. |
| Scope | Stable work label associated with this job. |
| Origin | Explicit source label or the observed parent scope. `unknown` means enqueue source context was not observed. |
| Parent | The job observed at enqueue time, or `-` when no enqueue parent was observed. |
| Status | Last observed state: queued, running, suspended, completed, canceled, failed, or incomplete. |
| Partial | `yes` when enqueue or part of the execution/completion fell outside the capture. |
| Queue wait ms | Observed enqueue to first observed execution. `unknown` if either boundary is unavailable or execution has not begun. |
| Execution ms | Sum of closed execution segments in this capture, excluding queue waits and time suspended between resumes. |
| Wall ms | First observed execution to observed termination or capture stop, including suspended waits. `unknown` until an end boundary is available. |
| Resumes | Number of observed execution segments, including the first entry. |
| Queue depth | Runner queue slots observed at enqueue, including the current slot where applicable. `unknown` for unobserved enqueue or work without a supplied queue depth. |

Work queued before capture, or resumed from an earlier session, is adopted as a partial job at its first observed execution. Its enqueue time, queue depth, origin, and enqueue parent remain unknown; execution-time context does not reconstruct them. A capture that stops while work is queued, running, or suspended marks it incomplete and partial. The report freezes at that boundary; later real execution does not revise the stopped job record. In-progress reports need not include the currently open segment until it yields, completes, or the capture stops.

For a partial job, Execution and Wall describe only observed boundaries, not its full lifetime. Jobs, Runner slices, and their nested scopes overlap, so their times must not be summed. Origin and Parent provide only observed scheduling relationships, not a complete causal graph of WoW events or ATT callbacks.

The `jobs` capacity limits retained records across the whole capture, including completed jobs; completed records do not free slots for later jobs. Existing records continue updating after the limit is reached. The omitted-observation count reports rejected allocation attempts, not a count of unique omitted jobs: enqueue and later execution/adoption can attempt observation separately, and a repeatedly resumed unrecorded coroutine can make further attempts. Capacity exhaustion affects observation only; ATT's actual queued work still runs.

### Timeline (Level 5 and above)

| Column | Meaning |
| --- | --- |
| At ms | Time of the observed record relative to capture start. |
| Event | Job lifecycle event (`queued`, `partial`, `resume`, `yield`, `completed`, `canceled`, `failed`, or `incomplete`), or `slow` for an accepted timing sample at or above the threshold. |
| ID | Stable job scope or timed scope ID. |
| Duration ms | Observed execution segment duration when supplied; `-` for events without a measured segment. |
| Context | Short observed job/origin context when available; `-` otherwise. |

Job lifecycle records are retained regardless of `slow`. Raising that threshold reduces `slow` records; it does not remove enqueue/resume/yield/completion records. Slow timings follow the selected module range, and Level 6 timing entries additionally follow its sampling policy. An outer resume scope can be closed outside the resumed coroutine and lack job context; the adjacent job lifecycle record still carries its observed job ID and execution duration.

The timeline is a circular buffer displayed oldest-to-newest among the retained entries. When full, each new entry overwrites the oldest one, and the overwritten count increases. This produces a recent window, not a complete history from capture start; it can lose the enqueue event for a job whose completion remains visible. The separate retained job record can still preserve its observed queue information. A `records=0` capture saves no timeline entries, while timing aggregates and independently enabled job records can continue collecting.

### Illustrative report excerpt

The values below are invented to demonstrate the columns. They are not an in-game benchmark or a claimed performance result. Spacing is expanded here for readability; the actual report uses tabs.

```text
ATT performance profile (session 1; stopped)
Elapsed: 12.00 s / 30.00 s limit; stopped: manual

Timing ID                      Calls  Total ms  Avg ms  Max ms  p95 bucket ms  Units
runner.events.slice            3      27.000    9.000   18.300  <=33.00        -
transmog.unique.collect        1      18.000    18.000  18.000  <=33.00        100000
transmog.sources.scan          1      6.000     6.000   6.000   <=8.00         100000

Counter ID                              Count
event.trigger.OnRecalculate              1
event.trigger.OnSourcesCollected         1
```

Here, the Unique calculation's single sample took 18 ms. The Runner also measured the execution containing that work, so summing all three timing totals would count some execution twice. Units of 100000 describe the scan bound, not 100000 collected appearances.

## Optional Blizzard metrics

When `C_AddOnProfiler` and the required enum entries are available and provide usable values, ATT samples them at capture start and stop. If the API provides `IsEnabled`, ATT also checks that it is enabled. ATT does not enable Blizzard profiling or change client profiler settings.

The report may include:

- **Recent average at start/stop:** Blizzard's rolling whole-addon `RecentAverageTime` sampled at those boundaries. These values are not the average of ATT's capture window, and subtracting them does not produce the capture's CPU time.
- **Ticks over 5/10 ms during capture:** Differences between Blizzard's cumulative `CountTimeOver5Ms` and `CountTimeOver10Ms` values at start and stop. A delta is shown only when both snapshots exist and the counter has not decreased.

These metrics describe the whole addon and may include work outside ATT's explicitly timed scopes. They are not FPS readings and must not be added to ATT's timing totals. A running report has no stop snapshot or final threshold deltas yet; stop the capture before copying a final report.

An absent or partial Blizzard section does not invalidate ATT's own capture. API availability, enabled state, and returned metrics can differ between client versions and game variants. If Blizzard's counters are reset during a capture, their boundary differences may be unavailable or unsuitable for comparison.

## Limits and measurement overhead

Recording is disabled by default. While disabled, instrumentation checks the enabled flag without taking timing samples, calling Blizzard's profiler API, or allocating sample data. An enabled capture adds clock reads and aggregation work, so use consistent profiling settings when comparing runs.

A capture stores at most 64 Overview metric IDs plus its configured detail-ID allowance. Metric IDs are limited to 96 bytes. After an allowance is reached, samples for additional IDs in that category are dropped; existing IDs continue accumulating. Detail IDs cannot consume the Overview allowance. Each timing scope keeps aggregates and a fixed histogram rather than retaining every sample. The load-time scope registry also has a fixed 512-handle limit; rejected registrations use a permanently disabled handle and are reported without aborting ATT.

Jobs, timeline records, and optional caller stacks have separate bounds. Reports identify overwritten or rejected records and partial observations. These limits make captures bounded; they do not guarantee a fixed CPU cost for a very high-frequency workload.

The report provides explicitly instrumented timings, counters, selected job histories, a bounded timeline, and optional sampled caller stacks. It does not provide an exhaustive function trace, FPS, memory usage, garbage-collection statistics, or native API exclusive CPU costs. Short stalls outside the instrumented paths may be absent. Observe FPS separately if it is part of the reported symptom.

## Compare two captures

For a Completionist-versus-Unique investigation:

1. Use the same character, zone, enabled addons, graphics settings, frame cap, and ATT filters, including Main Only and Transmog tracking. Wait for initial loading to settle.
2. Configure Completionist mode and let that mode change finish. Start a capture, perform a repeatable collection refresh action, and stop after it completes. Save the report as A.
3. Configure Unique mode and let that mode change finish. Start a new capture with the same duration, repeat the same refresh action, and save the report as B.
4. Repeat the pair where practical. Keep cache warm-up and the number of refresh actions consistent, and note whether the reported stutter reproduces.
5. Compare event counts and timing Calls to check workload differences. Then compare Avg, Max, and p95 for matching scopes. Compare Total only with the differing amounts of work in mind.

If switching modes is itself the problem, start the capture before that switch and document the starting and destination modes instead of using the settled-mode procedure above. Reproduce the same transition for repeated runs.

Include the game variant and build, ATT revision and data version, character class/race/faction, relevant ATT settings, capture duration, exact actions, and observed symptom alongside copied reports. The report does not collect that context automatically. Preserve A before starting B because each new capture clears the previous results.

## Local checks and runtime limits

Standalone tests exercise the capture core, level policy, login requests, commands, module call sites, Runner jobs, and ATT events using mocked WoW APIs. The tested runtimes are stock Lua 5.1.5 and Lua 5.5.1. The changed production Lua also passes the Lua 5.1 syntax check. These checks establish local behavior under the fixtures; they do not validate actual client API availability, UI behavior, frame scheduling, or capture overhead.

The Lua 5.1 Runner/event fixtures include a test-only adapter for WoW-style `xpcall` argument forwarding. They explicitly skip cases that yield through protected Runner or deferred-handler calls, which stock Lua 5.1 cannot execute with WoW's runtime behavior. The Lua 5.5 fixtures exercise those protected-call yield cases; standalone pooled-coroutine yield cases run in both runtimes. Passing either fixture does not establish that the same paths work in a particular WoW client.

## In-game validation pending

Before this Draft is considered ready, validate the following in the intended WoW clients:

- Load ATT with profiling disabled and confirm normal operation and no Lua errors.
- Start a capture, trigger a collection refresh, stop, and copy a readable report from the popup.
- Schedule a next-login capture, test normal logout/login and `/reload`, and confirm it starts before initial collection work, runs once, and can be canceled.
- Confirm automatic stopping, reset, invalid-duration handling, and repeated captures.
- Exercise all six levels, module inclusion/exclusion, sampling, job/metric limits, timeline overwrite, and optional stack limits; confirm that reports label partial and sampled coverage accurately.
- Test work queued before capture, jobs that yield, overlapping coroutines, canceled/reset jobs, and captures started or stopped within a job.
- Capture Completionist and Unique behavior and verify that the expected timing scopes and event counters appear when their paths execute.
- Check the optional Blizzard section where the API is available and enabled, and confirm ATT captures still work when that section is absent.
- Observe stutter and FPS with the profiler both disabled and enabled to assess capture overhead and report the client and settings used.

## AI assistance

AI assistance was used with **gpt-6-sol** for the initial Profiler implementation and tests, and **gpt-6.1-sol** for the standalone branch, reviews, LuaLS/function documentation, login scheduling, capture levels, instrumentation, tests, and this guide. The pull request lists the checks actually performed. Full in-game verification is pending; illustrative values do not substitute for client measurements.
