'use strict';

// Exact current form choices only. No prose inference or broad Classic fallback.
// Split Classic choices use dedicated labels; unavailable labels are skipped.
const FLAVOR_LABELS = Object.freeze({
  Retail: 'flavor:retail',
  'Classic Progression (MoP)': 'flavor:progression',
  'Classic Era': 'flavor:era',
  'Classic Hardcore': 'flavor:hardcore',
  'Classic Anniversary (TBC)': 'flavor:anniversary',
  'Season of Discovery': 'flavor:sod',
  Forever: 'flavor:forever',
  'All Flavors / Cross-Flavor': 'flavor:all',
  'Other / Unsure': null,
});

const DATA_LABELS = Object.freeze({
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
});

const COMMON_SECTIONS = [
  'WoW Flavor', 'WoW Environment', 'Region', 'WoW Client Build',
  'Special Event or Game Mode', 'WoW Client Language',
  'ATT Release Channel', 'Exact ATT Version',
];
const FORM_SECTIONS = Object.freeze({
  'type:bug': Object.freeze([
    ...COMMON_SECTIONS, 'Describe the Bug', 'Screenshot',
    'Reproduction Context', 'Lua Errors', 'Additional Context',
  ]),
  'type:data': Object.freeze([
    ...COMMON_SECTIONS, 'Data Categories', 'Affected Data',
    'Describe the Data Discrepancy', 'Data Evidence / Sources',
    'Verification / Reproduction Context', 'Additional Context',
  ]),
  'type:feature': Object.freeze([
    'Which WoW Flavors Does This Proposal Apply To?', 'WoW Environment',
    'What problem are you experiencing that led to this feature request?',
    'What solution would you like?', 'Any alternatives you can think of?',
    'Additional Context',
  ]),
});

function labelNames(labels) {
  if (!Array.isArray(labels)) return [];
  return labels.map(label => typeof label === 'string' ? label : label?.name)
    .filter(name => typeof name === 'string');
}

// Forms become editable Markdown, so this is a conservative layout check,
// not proof of template origin. Extra or repeated H3 headings fail closed.
function sectionsFromBody(body) {
  if (typeof body !== 'string' || body.length > 65536) return null;
  const sections = [];
  let fence = null;
  for (const line of body.replace(/\r\n?/g, '\n').split('\n')) {
    const marker = line.match(/^ {0,3}(`{3,}|~{3,})(.*)$/);
    if (fence) {
      if (marker && marker[1][0] === fence.character &&
          marker[1].length >= fence.length && /^\s*$/.test(marker[2])) {
        fence = null;
      }
    } else if (marker) {
      // CommonMark forbids backticks in a backtick fence's info string.
      if (marker[1][0] === '`' && marker[2].includes('`')) return null;
      fence = { character: marker[1][0], length: marker[1].length };
    } else {
      if (/^ {0,3}###(?:[ \t]+|$)/.test(line)) {
        const heading = line.match(/^### (.+)$/);
        if (!heading) return null;
        sections.push({ heading: heading[1], lines: [] });
        continue;
      }
    }
    if (sections.length) sections.at(-1).lines.push(line);
    else if (line.trim()) return null;
  }
  return fence ? null : sections;
}

function labelsFromSelection(text, mapping, multiple, required) {
  const value = text.trim();
  if (['', 'None', '_No response_'].includes(value)) return required ? null : [];
  if (/[\r\n]/.test(value)) return null;
  const options = value.split(',').map(option => option.trim());
  if ((!multiple && options.length !== 1) ||
      new Set(options).size !== options.length ||
      options.some(option => !Object.hasOwn(mapping, option))) return null;
  return options.map(option => mapping[option]).filter(Boolean);
}

function labelsForIssue(issue) {
  if (!issue || issue.pull_request) return [];
  const types = [...new Set(labelNames(issue.labels))]
    .filter(name => Object.hasOwn(FORM_SECTIONS, name));
  if (types.length !== 1) return [];
  const type = types[0];
  const sections = sectionsFromBody(issue.body);
  const headings = FORM_SECTIONS[type];
  if (!sections || sections.length !== headings.length ||
      sections.some((section, index) => section.heading !== headings[index])) return [];
  const feature = type === 'type:feature';
  // All Flavors is a feature-form choice only.
  const flavorMapping = feature ? FLAVOR_LABELS : Object.fromEntries(
    Object.entries(FLAVOR_LABELS).filter(([option]) => option !== 'All Flavors / Cross-Flavor')
  );
  const flavors = labelsFromSelection(sections[0].lines.join('\n'), flavorMapping, feature, true);
  if (flavors === null) return [];
  const categories = type === 'type:data'
    ? labelsFromSelection(sections[8].lines.join('\n'), DATA_LABELS, true, false) : [];
  if (categories === null) return [];
  return [...new Set([...flavors, ...categories])];
}

async function labelIssue({ github, context, core }) {
  if (context.eventName !== 'issues' ||
      !['opened', 'edited'].includes(context.payload?.action) ||
      context.payload?.issue?.pull_request ||
      context.payload?.repository?.full_name !== 'ATTWoWAddon/AllTheThings' ||
      context.repo?.owner !== 'ATTWoWAddon' || context.repo?.repo !== 'AllTheThings') return [];
  const number = context.payload?.issue?.number;
  if (!Number.isSafeInteger(number) || number <= 0) return [];
  const params = { ...context.repo, issue_number: number };
  // Re-read edits and manual labels; an event's snapshot may already be stale.
  const { data: issue } = await github.rest.issues.get(params);
  const candidates = labelsForIssue(issue);
  if (!candidates.length) return [];
  const assigned = new Set(labelNames(issue.labels));
  const pending = candidates.filter(label => !assigned.has(label));
  if (!pending.length) return [];
  const available = new Set(labelNames(await github.paginate(
    github.rest.issues.listLabelsForRepo, { ...context.repo, per_page: 100 }
  )));
  const missing = pending.filter(label => !available.has(label));
  if (missing.length) core.warning(`Skipping missing repository labels: ${missing.join(', ')}`);
  const additions = pending.filter(label => available.has(label));
  if (additions.length) {
    // Additive API only: never replace/remove labels or implicitly create them.
    await github.rest.issues.addLabels({ ...params, labels: additions });
    core.info(`Added form labels: ${additions.join(', ')}`);
  }
  return additions;
}

module.exports = { labelsForIssue, labelIssue, FORM_SECTIONS, FLAVOR_LABELS, DATA_LABELS };
