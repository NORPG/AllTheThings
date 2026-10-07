'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { test } = require('node:test');
const {
  labelsForIssue,
  labelIssue,
  FORM_SECTIONS,
  FLAVOR_LABELS,
  DATA_LABELS,
} = require('../issue-form-labels.cjs');

const fixtures = Object.fromEntries([
  ['type:bug', 'bug-report.md'],
  ['type:data', 'data-discrepancy.md'],
  ['type:feature', 'feature-request.md'],
].map(([type, filename]) => [type, fs.readFileSync(path.join(__dirname, 'fixtures', filename), 'utf8')]));

const formFiles = {
  'type:bug': 'bug_report.yml',
  'type:data': 'data_discrepancy.yml',
  'type:feature': 'feature_request.yml',
};
const flavorHeading = {
  'type:bug': 'WoW Flavor',
  'type:data': 'WoW Flavor',
  'type:feature': 'Which WoW Flavors Does This Proposal Apply To?',
};
const expectedFlavors = {
  Retail: 'flavor:retail',
  'Classic Progression (MoP)': 'flavor:progression',
  'Classic Era': 'flavor:era',
  'Classic Hardcore': 'flavor:hardcore',
  'Classic Anniversary (TBC)': 'flavor:anniversary',
  'Season of Discovery': 'flavor:sod',
  Forever: 'flavor:forever',
  'All Flavors / Cross-Flavor': 'flavor:all',
  'Other / Unsure': null,
};
const expectedData = {
  Items: 'db:items',
  Quests: 'db:quests',
  Achievements: 'db:achievements',
  'Creatures / NPCs': 'db:creatures',
  Objects: 'db:objects',
  Spells: 'db:spells',
  Mounts: 'db:mounts',
  Pets: 'db:pets',
  Decor: 'db:decor',
  'Warband campsites': 'db:warband-campsites',
  Professions: 'db:professions',
  Illusions: null,
  Appearances: null,
  'Drop sources': null,
  'Other / Unsure': null,
};
const allRepositoryLabels = [...new Set([
  ...Object.values(expectedFlavors),
  ...Object.values(expectedData),
].filter(Boolean))];

function issue(type, body = fixtures[type], extraLabels = []) {
  return { number: 2222, body, labels: [{ name: type }, ...extraLabels] };
}

function setSection(body, heading, answer) {
  const prefix = `### ${heading}\n\n`;
  const start = body.indexOf(prefix);
  assert.notEqual(start, -1, `Fixture must contain section: ${heading}`);
  const end = body.indexOf('\n### ', start + prefix.length);
  return body.slice(0, start + prefix.length) + answer + '\n' +
    (end === -1 ? '' : body.slice(end));
}

function selectedIssue(type, flavor, data = 'None') {
  let body = setSection(fixtures[type], flavorHeading[type], flavor);
  if (type === 'type:data') body = setSection(body, 'Data Categories', data);
  return issue(type, body);
}

function assertLabels(actual, expected) {
  assert.deepEqual([...actual].sort(), [...expected].sort());
  assert.equal(actual.length, new Set(actual).size, 'Candidate labels must be unique');
}

// A deliberately small reader for this repository's quoted field labels/options.
// This is a layout-drift check, not a second general-purpose YAML parser.
function readFormFields(filename) {
  const source = fs.readFileSync(path.join(__dirname, '../../ISSUE_TEMPLATE', filename), 'utf8');
  return source.split(/^  - type: /m).slice(1).flatMap((block) => {
    if (block.startsWith('markdown\n')) return [];
    const label = block.match(/^      label: "(.*)"$/m)?.[1];
    assert.ok(label, `${filename}: expected a quoted field label`);
    return [{
      label,
      options: [...block.matchAll(/^        - "(.*)"$/gm)].map((match) => match[1]),
      multiple: /^      multiple: true$/m.test(block),
    }];
  });
}

function apiHarness({
  type = 'type:bug',
  freshIssue = issue(type),
  eventIssue = issue(type),
  action = 'opened',
  eventName = 'issues',
  owner = 'ATTWoWAddon',
  repo = 'AllTheThings',
  repositoryLabels = allRepositoryLabels,
} = {}) {
  const calls = { get: [], paginate: [], add: [], warnings: [], infos: [] };
  const repository = { full_name: `${owner}/${repo}`, name: repo, owner: { login: owner } };
  const context = {
    eventName,
    repo: { owner, repo },
    issue: { owner, repo, number: 2222 },
    payload: { action, issue: structuredClone(eventIssue), repository },
  };
  const listLabelsForRepo = async () => {
    throw new Error('Use pagination to inspect the complete repository label inventory');
  };
  const github = {
    rest: { issues: {
      get: async (params) => {
        calls.get.push(params);
        return { data: structuredClone(freshIssue) };
      },
      listLabelsForRepo,
      addLabels: async (params) => {
        calls.add.push(structuredClone(params));
        return { data: params.labels.map((name) => ({ name })) };
      },
      removeLabel: async () => { throw new Error('Existing labels must never be removed'); },
      setLabels: async () => { throw new Error('Existing labels must never be replaced'); },
      createLabel: async () => { throw new Error('Missing repository labels must never be created'); },
    } },
    paginate: async (endpoint, params) => {
      assert.equal(endpoint, listLabelsForRepo);
      calls.paginate.push(params);
      return repositoryLabels.map((name) => ({ name }));
    },
  };
  const core = {
    warning: (message) => calls.warnings.push(String(message)),
    info: (message) => calls.infos.push(String(message)),
    debug: () => {},
  };
  return { github, context, core, calls, freshIssue };
}

test('fixtures and parser headings match each current form, in order', () => {
  for (const [type, filename] of Object.entries(formFiles)) {
    const fields = readFormFields(filename);
    const fixtureHeadings = [...fixtures[type].matchAll(/^### (.+)$/gm)].map((match) => match[1]);
    assert.deepEqual(FORM_SECTIONS[type], fields.map((field) => field.label));
    assert.deepEqual(fixtureHeadings, fields.map((field) => field.label));
    const flavorField = fields.find((field) => field.label === flavorHeading[type]);
    const expectedOptions = Object.keys(expectedFlavors).filter((option) =>
      type === 'type:feature' || option !== 'All Flavors / Cross-Flavor');
    assert.deepEqual(flavorField.options, expectedOptions);
    assert.equal(flavorField.multiple, type === 'type:feature');
    if (type === 'type:data') {
      const dataField = fields.find((field) => field.label === 'Data Categories');
      assert.deepEqual(dataField.options, Object.keys(expectedData));
      assert.equal(dataField.multiple, true);
    }
  }
});

test('exported allowlists match the reviewed flavor and data mappings', () => {
  assert.deepEqual(FLAVOR_LABELS, expectedFlavors);
  assert.deepEqual(DATA_LABELS, expectedData);
  assert.ok(!Object.values(FLAVOR_LABELS).includes('flavor:classic'));
});

test('realistic issue-form Markdown maps only selected fields', () => {
  assertLabels(labelsForIssue(issue('type:bug')), ['flavor:retail']);
  assertLabels(labelsForIssue(issue('type:data')), [
    'flavor:progression', 'db:items', 'db:quests', 'db:creatures',
  ]);
  assertLabels(labelsForIssue(issue('type:feature')), ['flavor:retail', 'flavor:era']);
});

test('every supported flavor maps exactly; Other is explicitly unmapped', () => {
  for (const [option, label] of Object.entries(expectedFlavors)) {
    for (const type of Object.keys(formFiles)) {
      if (option === 'All Flavors / Cross-Flavor' && type !== 'type:feature') continue;
      assertLabels(labelsForIssue(selectedIssue(type, option)), label ? [label] : []);
    }
  }
});

test('all data category options are accepted, with only eleven direct labels', () => {
  for (const [option, label] of Object.entries(expectedData)) {
    assertLabels(labelsForIssue(selectedIssue('type:data', 'Retail', option)), [
      'flavor:retail', ...(label ? [label] : []),
    ]);
  }
  assertLabels(labelsForIssue(selectedIssue('type:data', 'Retail', Object.keys(expectedData).join(', '))), [
    'flavor:retail', ...Object.values(expectedData).filter(Boolean),
  ]);
});

test('multiple flavor selections preserve explicit All and Other without inference', () => {
  const all = Object.keys(expectedFlavors).join(', ');
  assertLabels(labelsForIssue(selectedIssue('type:feature', all)), Object.values(expectedFlavors).filter(Boolean));
  assertLabels(labelsForIssue(selectedIssue('type:feature', 'All Flavors / Cross-Flavor, Retail')), [
    'flavor:all', 'flavor:retail',
  ]);
  assertLabels(labelsForIssue(selectedIssue('type:feature', 'Other / Unsure, Classic Era')), ['flavor:era']);
  assertLabels(labelsForIssue(selectedIssue('type:data', 'Other / Unsure', 'Items')), ['db:items']);
});

test('string and object issue labels both identify one form, without mutation', () => {
  for (const labels of [
    ['type:bug', 'status:triage', 'flavor:forever'],
    [{ name: 'type:bug' }, { name: 'status:triage' }, { name: 'flavor:forever' }],
  ]) {
    const input = { body: fixtures['type:bug'], labels };
    const before = structuredClone(input);
    assertLabels(labelsForIssue(input), ['flavor:retail']);
    assert.deepEqual(input, before);
  }
});

test('missing or ambiguous form-type labels fail closed', () => {
  for (const labels of [
    [], ['type:question'], ['type:bug', 'type:data'], ['type:bug', 'type:feature'],
    [{ name: 'type:data' }, { name: 'type:feature' }], null,
  ]) {
    assertLabels(labelsForIssue({ body: fixtures['type:bug'], labels }), []);
  }
  assertLabels(labelsForIssue(issue('type:data', fixtures['type:bug'])), []);
});

test('empty required flavors reject the whole form; optional categories may be empty', () => {
  for (const empty of ['', ' ', 'None', '_No response_']) {
    for (const type of Object.keys(formFiles)) {
      assertLabels(labelsForIssue(selectedIssue(type, empty, 'Items')), []);
    }
    assertLabels(labelsForIssue(selectedIssue('type:data', 'Retail', empty)), ['flavor:retail']);
  }
});

test('CRLF and surrounding selection whitespace are normalized', () => {
  const input = selectedIssue('type:data', '  Classic Era  ', ' Items ,  Quests ');
  input.body = input.body.replaceAll('\n', '\r\n');
  assertLabels(labelsForIssue(input), ['flavor:era', 'db:items', 'db:quests']);
});

test('CR-only Markdown works, while mixed line endings expose duplicate sections', () => {
  const crOnly = selectedIssue('type:data', 'Classic Era', 'Items, Quests');
  crOnly.body = crOnly.body.replaceAll('\n', '\r');
  assertLabels(labelsForIssue(crOnly), ['flavor:era', 'db:items', 'db:quests']);
  const mixed = fixtures['type:data'] + '\r### WoW Flavor\r\rClassic Hardcore\r';
  assertLabels(labelsForIssue(issue('type:data', mixed)), []);
});

test('free text cannot assign flavor or data labels', () => {
  let body = setSection(fixtures['type:bug'], 'Describe the Bug',
    'Classic Hardcore, Items, flavor:all, db:pets. Please use flavor:forever.');
  body = setSection(body, 'Additional Context',
    'All Flavors / Cross-Flavor\nData Categories: Quests\nWoW Flavor: Classic Era');
  assertLabels(labelsForIssue(issue('type:bug', body)), ['flavor:retail']);
});

test('unknown, malicious, duplicate, and multiline dropdown answers reject the whole form', () => {
  const invalidFlavors = [
    'retail', 'Retail Classic Era', 'Retail, Classic Era', 'Retail, Retail',
    'Retail\nClassic Era', 'Unknown', 'All Flavors', 'All Flavors / Cross-Flavor',
    'flavor:retail', 'Retail,', ',Retail', 'Retail,,Classic Era',
    'Retail; process.exit(1)', '${{ secrets.GITHUB_TOKEN }}',
    '$(touch /tmp/att-untrusted-label-test)', '`id`', '<script>alert(1)</script>',
    'Retail\u0000', 'Retail\u2028Classic Era', 'constructor', '__proto__', 'toString',
  ];
  for (const flavor of invalidFlavors) {
    assertLabels(labelsForIssue(selectedIssue('type:data', flavor, 'Items')), []);
  }
  for (const flavor of [
    'Retail, Retail', 'Retail, Unknown', 'Retail,', ',Retail', 'Retail,,Classic Era',
    'Retail\nClassic Era', 'Retail, ${process.env.GITHUB_TOKEN}',
    'Retail, ${{ github.token }}', 'Retail, $(echo Classic Era)', 'None, Retail',
  ]) {
    assertLabels(labelsForIssue(selectedIssue('type:feature', flavor)), []);
  }
  for (const categories of [
    'Items, Items', 'Items, Unlisted', 'Items\nQuests', 'Items,', ',Items',
    'Items,,Quests', 'Items, ${{ secrets.GITHUB_TOKEN }}',
    'Items, $(touch /tmp/att-untrusted-label-test)', 'Items, db:quests',
    '- Items\n- Quests', 'Items\u0000', 'None, Items', '__proto__',
  ]) {
    assertLabels(labelsForIssue(selectedIssue('type:data', 'Retail', categories)), []);
  }
});

test('missing, duplicated, unexpected, or reordered form headings fail closed', () => {
  const body = fixtures['type:bug'];
  const malformed = [
    body.replace('### Region\n\nNone\n\n', ''),
    body.replace('### Region', '### Unexpected Field'),
    body + '\n### WoW Flavor\n\nClassic Era\n',
    body + '\n### Data Categories\n\nItems\n',
    body.replace('### WoW Environment', '### Temporary')
      .replace('### Region', '### WoW Environment').replace('### Temporary', '### Region'),
    body.replace('### WoW Flavor', '### WoW Flavor '),
    'Retail\n',
  ];
  for (const candidate of malformed) assertLabels(labelsForIssue(issue('type:bug', candidate)), []);
});

test('noncanonical Markdown H3 sections reject ambiguous data forms', () => {
  const base = fixtures['type:data'];
  const variants = [
    ' ### WoW Flavor',
    '  ### WoW Flavor',
    '   ### WoW Flavor',
    '###\tWoW Flavor',
    '### \tWoW Flavor',
    '###',
    '### WoW Flavor ###',
  ];
  for (const heading of variants) {
    const extraSection = `${heading}\n\nClassic Hardcore\n`;
    // Both a missing canonical field and an extra ambiguous section must fail.
    const replaced = base.replace('### WoW Flavor', heading);
    assertLabels(labelsForIssue(issue('type:data', replaced)), []);
    assertLabels(labelsForIssue(issue('type:data', base + '\n' + extraSection)), []);
    const inDescription = setSection(base, 'Describe the Data Discrepancy',
      'The records disagree.\n\n' + extraSection);
    assertLabels(labelsForIssue(issue('type:data', inDescription)), []);
  }
});

test('noncanonical H3 examples inside closed fences cannot spoof data selections', () => {
  const examples = [
    ' ### WoW Flavor', '  ### Data Categories', '   ### WoW Flavor',
    '###\tData Categories', '###', '### WoW Flavor ###',
  ].map((heading) => `${heading}\n\nClassic Hardcore`).join('\n');
  for (const fence of ['```', '~~~']) {
    const body = setSection(fixtures['type:data'], 'Additional Context',
      `${fence}text\n${examples}\n${fence}`);
    assertLabels(labelsForIssue(issue('type:data', body)), [
      'flavor:progression', 'db:items', 'db:quests', 'db:creatures',
    ]);
  }
});

test('fenced stack traces and code examples cannot spoof form sections', () => {
  for (const [opening, closing] of [
    ['```text', '```'], ['~~~~text', '~~~~'], ['````text', '````'],
  ]) {
    const stackTrace = `${opening}\n### WoW Flavor\n\nClassic Era\n` +
      '### Data Categories\n\nQuests\n### Additional Context\n\nspoof\n' + closing;
    const body = setSection(fixtures['type:bug'], 'Lua Errors', stackTrace);
    assertLabels(labelsForIssue(issue('type:bug', body)), ['flavor:retail']);
  }
  const unclosed = setSection(fixtures['type:bug'], 'Lua Errors', '```text\nmissing closing fence');
  assertLabels(labelsForIssue(issue('type:bug', unclosed)), []);
  const invalidSelection = setSection(fixtures['type:bug'], 'WoW Flavor', '```text\nRetail\n```');
  assertLabels(labelsForIssue(issue('type:bug', invalidSelection)), []);
});

test('invalid backtick fence info cannot hide visible duplicate headings', () => {
  for (const opening of ['```text```', '```text`invalid', '````language`']) {
    const spoof = `${opening}\n### WoW Flavor\n\nClassic Hardcore\n` +
      '### Data Categories\n\nPets\n````';
    const body = setSection(fixtures['type:data'], 'Additional Context', spoof);
    assertLabels(labelsForIssue(issue('type:data', body)), []);
  }
});

test('valid tilde fence info may contain backticks and keeps code headings ignored', () => {
  for (const opening of ['~~~text`valid', '~~~text```', '~~~~`language`']) {
    const example = `${opening}\n### WoW Flavor\n\nClassic Hardcore\n` +
      '### Data Categories\n\nPets\n~~~~';
    const body = setSection(fixtures['type:data'], 'Additional Context', example);
    assertLabels(labelsForIssue(issue('type:data', body)), [
      'flavor:progression', 'db:items', 'db:quests', 'db:creatures',
    ]);
  }
});

test('non-string, absent, and oversized issue bodies fail closed', () => {
  for (const input of [null, undefined, {}, { labels: ['type:bug'] },
    { body: null, labels: ['type:bug'] }, { body: {}, labels: ['type:bug'] }]) {
    assertLabels(labelsForIssue(input), []);
  }
  const body = fixtures['type:bug'];
  const atLimit = body + 'x'.repeat(65536 - body.length);
  assertLabels(labelsForIssue(issue('type:bug', atLimit)), ['flavor:retail']);
  assertLabels(labelsForIssue(issue('type:bug', atLimit + 'x')), []);
});

test('opened issues add only absent existing labels and preserve manual labels', async () => {
  const freshIssue = issue('type:data', fixtures['type:data'], [
    { name: 'db:items' }, { name: 'flavor:forever' }, { name: 'status:triage' },
  ]);
  const before = structuredClone(freshIssue);
  const harness = apiHarness({ type: 'type:data', freshIssue });
  await labelIssue(harness);
  assert.deepEqual(harness.calls.get, [{ owner: 'ATTWoWAddon', repo: 'AllTheThings', issue_number: 2222 }]);
  assert.deepEqual(harness.calls.paginate, [{ owner: 'ATTWoWAddon', repo: 'AllTheThings', per_page: 100 }]);
  assert.equal(harness.calls.add.length, 1);
  assert.deepEqual({ ...harness.calls.add[0], labels: undefined }, {
    owner: 'ATTWoWAddon', repo: 'AllTheThings', issue_number: 2222, labels: undefined,
  });
  assertLabels(harness.calls.add[0].labels, ['flavor:progression', 'db:quests', 'db:creatures']);
  assert.deepEqual(freshIssue, before);
});

test('already-labeled issues are idempotent and cause no label-write API call', async () => {
  for (const assigned of [
    ['type:bug', 'flavor:retail', 'manual:keep'],
    [{ name: 'type:bug' }, { name: 'flavor:retail' }, { name: 'manual:keep' }],
  ]) {
    const harness = apiHarness({ freshIssue: { number: 2222, body: fixtures['type:bug'], labels: assigned } });
    await labelIssue(harness);
    assert.equal(harness.calls.add.length, 0);
  }
});

test('edited issues use the freshly fetched body and keep previous selection labels', async () => {
  const freshIssue = selectedIssue('type:bug', 'Classic Era');
  freshIssue.labels.push({ name: 'flavor:retail' }, { name: 'manual:keep' });
  const harness = apiHarness({ freshIssue, eventIssue: issue('type:bug'), action: 'edited' });
  await labelIssue(harness);
  assert.equal(harness.calls.add.length, 1);
  assertLabels(harness.calls.add[0].labels, ['flavor:era']);
  assert.deepEqual(freshIssue.labels, [
    { name: 'type:bug' }, { name: 'flavor:retail' }, { name: 'manual:keep' },
  ]);
});

test('a stale valid event cannot label a freshly malformed issue', async () => {
  const harness = apiHarness({
    eventIssue: issue('type:bug'),
    freshIssue: selectedIssue('type:bug', 'Retail\nClassic Era'),
    action: 'edited',
  });
  await labelIssue(harness);
  assert.equal(harness.calls.get.length, 1);
  assert.equal(harness.calls.add.length, 0);
});

test('missing split labels are reported and skipped without creation or fallback', async () => {
  for (const [flavor, missingLabel] of [
    ['Classic Progression (MoP)', 'flavor:progression'],
    ['Classic Era', 'flavor:era'],
    ['Classic Hardcore', 'flavor:hardcore'],
  ]) {
    const repositoryLabels = allRepositoryLabels.filter((name) => name !== missingLabel);
    repositoryLabels.push('flavor:classic');
    const harness = apiHarness({
      type: 'type:data', freshIssue: selectedIssue('type:data', flavor, 'Items'), repositoryLabels,
    });
    await labelIssue(harness);
    assert.equal(harness.calls.add.length, 1);
    assertLabels(harness.calls.add[0].labels, ['db:items']);
    assert.ok(harness.calls.warnings.some((message) => message.includes(missingLabel)));
  }
  const harness = apiHarness({ repositoryLabels: [] });
  await labelIssue(harness);
  assert.equal(harness.calls.add.length, 0);
  assert.ok(harness.calls.warnings.some((message) => message.includes('flavor:retail')));
});

test('unrecognized forms, unknown choices, and ambiguous types cause no label writes', async () => {
  for (const freshIssue of [
    issue('type:bug', 'Free-form report mentions Retail'),
    selectedIssue('type:data', 'Retail', 'Items, Unknown'),
    { ...issue('type:bug'), labels: ['type:bug', 'type:data'] },
    selectedIssue('type:bug', 'Other / Unsure'),
  ]) {
    const harness = apiHarness({ freshIssue });
    await labelIssue(harness);
    assert.equal(harness.calls.add.length, 0);
  }
});

test('non-issue events, unrelated actions/repositories, and PR payloads stop before any API read', async () => {
  const cases = [
    { eventName: 'pull_request' }, { eventName: 'pull_request_target' },
    { eventName: 'workflow_dispatch' }, { action: 'closed' }, { action: 'labeled' },
    { action: 'reopened' }, { owner: 'someone-else' }, { repo: 'Unrelated' },
    { eventIssue: { ...issue('type:bug'), pull_request: { url: 'https://example.invalid/pr/1' } } },
  ];
  for (const options of cases) {
    const harness = apiHarness(options);
    await labelIssue(harness);
    assert.deepEqual(harness.calls.get, []);
    assert.deepEqual(harness.calls.paginate, []);
    assert.deepEqual(harness.calls.add, []);
  }
});

test('missing/invalid issue numbers and inconsistent repository payloads stop before reads', async () => {
  for (const number of [undefined, null, 0, -1, '2222', 1.5]) {
    const harness = apiHarness();
    harness.context.payload.issue.number = number;
    await labelIssue(harness);
    assert.equal(harness.calls.get.length, 0);
    assert.equal(harness.calls.add.length, 0);
  }
  const missing = apiHarness();
  delete missing.context.payload.issue;
  await labelIssue(missing);
  assert.equal(missing.calls.get.length, 0);
  const fork = apiHarness();
  fork.context.payload.repository.full_name = 'someone-else/AllTheThings';
  fork.context.payload.repository.owner.login = 'someone-else';
  await labelIssue(fork);
  assert.equal(fork.calls.get.length, 0);
});

test('a PR returned by the current-issue API cannot be labeled', async () => {
  const harness = apiHarness({
    freshIssue: { ...issue('type:bug'), pull_request: { url: 'https://example.invalid/pr/1' } },
  });
  await labelIssue(harness);
  assert.equal(harness.calls.get.length, 1);
  assert.equal(harness.calls.add.length, 0);
});
