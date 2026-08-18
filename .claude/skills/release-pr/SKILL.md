---
name: release-pr
description: >
  Open a release PR for stream-feeds-flutter: bump the `stream_feeds` version, finalise its hand-curated
  CHANGELOG (promote `## Upcoming` → `## X.Y.Z`), and open a PR from a `release/` branch. Merging the PR
  triggers automatic tagging and pub.dev publishing.
disable-model-invocation: true
argument-hint: "[<version>]"
arguments: [version]
allowed-tools:
  - Bash(git *)
  - Bash(gh *)
  - Bash(melos *)
  - Bash(which *)
  - Bash(grep *)
  - Bash(sed *)
  - Read
  - Edit
  - Write
---

# release-pr

Opens a release PR for stream-feeds-flutter. Branch `release/stream_feeds-vX.Y.Z` → base `main` → title
`chore(llc): release stream_feeds vX.Y.Z`.

**This skill only opens the PR.** After merge, tagging and pub.dev publishing are automatic:
[`release_tag.yml`](../../../.github/workflows/release_tag.yml) tags every unpublished package
(`<pkg>-vX.Y.Z`) and [`release_publish.yml`](../../../.github/workflows/release_publish.yml) publishes it
and cuts a GitHub Release. See the "Releasing" section of `AGENTS.md`.

## Key facts for this repo

- **One publishable package: `stream_feeds`.** `stream_feeds_test`, `docs`, `sample_app`, and
  `packages/*/example` are private — `--no-private` is what keeps them out of tagging and publishing, so
  never remove `publish_to: none` (or add a `version:` to `docs`) without understanding that.
  Confirm the publishable set with `melos list --no-private`.
- **Independent per-package versioning** (`versioning: mode: independent` in `melos.yaml`). The release tag
  is `stream_feeds-vX.Y.Z`, not a plain `vX.Y.Z`. Older plain `v0.x` tags are history and no longer match
  the publish trigger.
- **CHANGELOGs are hand-curated.** Never run `melos version` — it regenerates changelog entries from commit
  messages and clobbers the curated `## Upcoming` bullets. Releasing means *promoting* the existing
  `## Upcoming` heading to `## X.Y.Z`, not rewriting it.
- **`release/` branch is a convention here**, not an enforced check (unlike stream-core-flutter, this repo's
  `pr_title.yml` has no changelog-placement job). Use it anyway so release PRs are recognisable.

Conventional-commit scopes are defined in `.github/workflows/pr_title.yml`; the `semantic_changelog_update`
job maps each scope to a package path. Read that map rather than hard-coding it, so adding a package needs no
change here:

```bash
grep -A12 'semantic_changelog_update' .github/workflows/pr_title.yml
```

Today: `llc` → `packages/stream_feeds`. (`repo` and `samples` are valid PR scopes but map to no package.)

## Inputs

1. **Version.** If given as an arg (e.g. `/release-pr 0.5.2`), use it; strip any leading `v`. Otherwise
   **propose and confirm**: derive a version per [Choosing the version](#choosing-the-version) and let the
   user confirm or override.
2. **Base branch** is always `main`.

A release is warranted when `packages/stream_feeds/CHANGELOG.md` has a non-empty `## Upcoming` section. If it
doesn't, say so and stop — there is nothing to release.

## Choosing the version

Two steps: classify the release from its CHANGELOG, then map that onto the current version.

**1. Classify.** Read the curated `## Upcoming` section — the same bullets that become the release notes, so
they are the authority on what the release contains:

```bash
sed -n '/^## Upcoming/,/^## [0-9]/p' packages/stream_feeds/CHANGELOG.md
```

This repo's sub-headings are free-form and descriptive (`### New fields`, `### WebSocket events`,
`### Deprecated — renamed types`, `### 🛑 Breaking`, …), so a keyword grep is a **signal, not a verdict**:

```bash
sed -n '/^## Upcoming/,/^## [0-9]/p' packages/stream_feeds/CHANGELOG.md | grep -in 'breaking\|removed\|renamed'
```

**Actually read the section** and classify it yourself:

- **breaking** — an existing API is removed, renamed without a compatible alias, changes signature, or
  changes behaviour in a way that breaks callers.
- **compatible, adds API** — new fields, new methods, new events, new optional parameters.
- **no public API change** — internal fixes, docs, dependency bumps.

**Deprecations are not breaking** — a deprecated API still works, so a release that only deprecates (e.g.
renamed types shipped with backwards-compatible `typedef` aliases) is compatible. A rename **without** an
alias is breaking.

**2. Map onto the current version.** The same release is a different bump depending on where the package
sits, per the Dart community convention in
[Package versioning](https://dart.dev/tools/pub/versioning#semantic-versions):

> Although semantic versioning doesn't promise any compatibility between versions prior to `1.0.0`, the Dart
> community convention is to treat those versions semantically as well. The interpretation of each number is
> just shifted down one slot: going from `0.1.2` to `0.2.0` indicates a breaking change, going to `0.1.3`
> indicates a new feature, and going to `0.1.2+1` indicates a change that doesn't affect the public API. For
> simplicity's sake, avoid using `+` after the version reaches `1.0.0`.

Read the current version first — `grep '^version:' packages/stream_feeds/pubspec.yaml` — and pick the column
from it rather than assuming either regime:

| Release | at/above `1.0.0` | below `1.0.0` |
| --- | --- | --- |
| breaking | major | minor |
| compatible, adds API | minor | patch |
| no public API change | patch | build (`+1`) |

`stream_feeds` is currently below `1.0.0`, so the right-hand column applies: a breaking release is a **minor**
bump and a feature release is a **patch** bump.

The shift matters because a caret constraint stops at the leading significant digit: `^1.4.1` means
`>=1.4.1 <2.0.0` (major breaks), while `^0.5.1` means `>=0.5.1 <0.6.0` (minor breaks). Whichever slot that is,
bumping it strands every consumer on the old caret until they hand-edit their pubspec — so bump it only for a
genuinely breaking release.

State the proposed version, what in the `## Upcoming` section drove the classification, and which column you
used; then ask the user to confirm — **they still decide**. If they supply a version that disagrees with the
derivation, say so once, then use theirs.

A behavior change that is source-compatible but alters observable output (changed defaults, changed state
semantics, changed event handling) is breaking for consumers even though it compiles — classify it as
breaking, and file it under a `### 🛑 Breaking` heading when writing the entry.

> There is no undo: pub.dev cannot delete a published version. Get the bump right before merge.

## Pre-flight

Run these. **If any fails, stop, surface it to the user, and do not auto-fix** (no stashing, no force-pull, no
killing processes).

- `git checkout main && git pull --ff-only` leaves `git status --short` clean — **including untracked files**,
  so a stray local file can't slip into the release commit at `git add -A` (step 5).
- `which melos`, `gh auth status` succeed.
- Latest CI on `main` is green: `gh run list --branch main --limit 5` — no failures on the most recent runs.
- No open release PR for the same branch: `gh pr list --head <branch> --state all --json number` returns `[]`.

## Steps

### 1. Branch off main

```bash
git checkout -b release/stream_feeds-vX.Y.Z
```

### 2. Bump the version

- Set `version: <newver>` in `packages/stream_feeds/pubspec.yaml`.
- Bump the `stream_feeds:` entry in `melos.yaml`'s `command.bootstrap.dependencies` block
  (`grep -nE '^\s+stream_feeds:' melos.yaml`) **only if** the existing caret no longer allows the new version
  (e.g. `0.5.1 → 0.6.0` under `stream_feeds: ^0.5.1`). A bump the caret already covers (`0.5.1 → 0.5.2`) needs
  no change. This block is what `docs`, `sample_app`, and the example app resolve against.

Then propagate constraints:

```bash
melos bootstrap
```

Do **not** run `melos version`.

### 3. Finalise the CHANGELOG

In `packages/stream_feeds/CHANGELOG.md`, rename the top `## Upcoming` heading to `## <newver>`. Keep the
curated bullets exactly as they are — do not add, rewrite, or regenerate them. Sub-headings stay untouched.

The `## <newver>` section must be non-empty (pana fails on an empty or missing one).

### 4. Sanity-check

```bash
melos run analyze
melos run lint:pub
```

If either fails, surface it and stop.

### 5. Commit and push

```bash
git add -A
git commit -m "chore(llc): release stream_feeds vX.Y.Z"
git push -u origin release/stream_feeds-vX.Y.Z
```

Single commit. **The title prefix is load-bearing** — `release_tag.yml` gates on `chore(` … `): release`.
Tagging derives from package state, not this title, so a typo in the package name or version can't mis-tag —
but keep the prefix intact or the tag job won't fire.

### 6. Open the PR

Build the body from the promoted CHANGELOG section (the same content that becomes the GitHub Release). Do
**not** use `gh api .../generate-notes` — this repo deliberately does not use GitHub's generated notes.

```bash
gh pr create --base main --head release/stream_feeds-vX.Y.Z \
  --title "chore(llc): release stream_feeds vX.Y.Z" --body-file <notes>
```

Return the PR URL.

**Tell the user to squash-merge it.** `release_tag.yml` gates on the *tip* commit's message, so a squash lands
the `chore(llc): release …` title as that commit. A merge commit would make the tip `Merge pull request #…`
and the release would silently not run.

## After merge (FYI)

`release_tag.yml` tags `stream_feeds-vX.Y.Z` and pushes it with the bot PAT; `release_publish.yml` fires on
that tag push, publishes to pub.dev over OIDC, and creates a GitHub Release from the CHANGELOG section. Both
are idempotent — a re-run against a version already live on pub.dev is a clean no-op.

## Don't

- **Never bump the breaking slot without a breaking change** in `## Upcoming` — below `1.0.0` that slot is the
  **minor**, and bumping it strands every consumer on the old caret. See
  [Choosing the version](#choosing-the-version).
- **Never run `melos version`** — it clobbers the hand-curated CHANGELOG.
- **Never tag or push a tag** — `release_tag.yml` does it on merge.
- **Never run `melos run release:pub` locally** — it's the CI publish step; running it publishes from an
  unreviewed tree. Refuse even if asked. (Tagging is inlined in `release_tag.yml`, not a melos script — don't
  run it by hand either.)
- **Never create a GitHub release** (`gh release create`) — `release_publish.yml` creates it after the tag is
  pushed.
- **Never merge the PR.** Return the URL and stop.
