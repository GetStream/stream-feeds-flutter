---
name: release-pr
description: >
  Open a release PR for stream-feeds-flutter: bump the version in melos.yaml and the package pubspec, finalise
  the CHANGELOG, and open a PR against main with auto-generated release notes.
disable-model-invocation: true
argument-hint: "[version]"
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

Opens a release PR for stream-feeds-flutter. Branch `release/v<X.Y.Z>` → base `main` → title
`chore(llc): release v<X.Y.Z>`.

**This skill only opens the PR.** After merge, tagging and pub.dev publishing are automatic:
[`release_tag.yml`](../../../.github/workflows/release_tag.yml) extracts `vX.Y.Z` from the commit message and
pushes the tag; [`release_publish.yml`](../../../.github/workflows/release_publish.yml) publishes to pub.dev
over OIDC and creates the GitHub Release. See the "Releasing" section of `AGENTS.md`.

If `$version` is provided (e.g. `/release-pr 0.5.2`), use it. Strip any leading `v`. Otherwise derive and
confirm per [Choosing the version](#choosing-the-version).

## Key facts for this repo

- **One publishable package: `stream_feeds`.** `stream_feeds_test`, `docs`, `sample_app`, and
  `packages/*/example` are private (`publish_to: none`, or no `version:`); `--no-private` is what keeps them
  out of publishing. Confirm the publishable set with `melos list --no-private`.
- **Tags are plain `vX.Y.Z`**, continuing the repo's existing tag history — not per-package tags.
- **CHANGELOG is hand-curated.** Never run `melos version` — it regenerates entries from commit messages and
  clobbers the curated `## Upcoming` bullets. Releasing means *promoting* `## Upcoming` to `## X.Y.Z`.
- **`release/` branch is a convention** here, not an enforced check. Use it anyway so release PRs are
  recognisable.

## Inputs

1. **Version** (`X.Y.Z` or `X.Y.Z-suffix`). Use `$version` if supplied; otherwise derive it below and confirm
   with the user. Don't silently infer.
2. **Previous tag** for the release-notes diff: `gh release list --limit 10` — the most recent tag of the same
   train (stable = no hyphen in the tag; pre-release = matches the same suffix prefix).

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
`### Deprecated — renamed types`, …), so a keyword grep is a **signal, not a verdict**:

```bash
sed -n '/^## Upcoming/,/^## [0-9]/p' packages/stream_feeds/CHANGELOG.md | grep -in 'breaking\|removed\|renamed'
```

**Actually read the section** and classify it yourself:

- **breaking** — an existing API is removed, renamed without a compatible alias, changes signature, or changes
  behaviour in a way that breaks callers.
- **compatible, adds API** — new fields, new methods, new events, new optional parameters.
- **no public API change** — internal fixes, docs, dependency bumps.

**Deprecations are not breaking** — a deprecated API still works, so a release that only deprecates (e.g.
renamed types shipped with backwards-compatible `typedef` aliases) is compatible. A rename **without** an
alias is breaking.

**2. Map onto the current version.** The same release is a different bump depending on where the package sits,
per the Dart community convention in
[Package versioning](https://dart.dev/tools/pub/versioning#semantic-versions):

> Although semantic versioning doesn't promise any compatibility between versions prior to `1.0.0`, the Dart
> community convention is to treat those versions semantically as well. The interpretation of each number is
> just shifted down one slot: going from `0.1.2` to `0.2.0` indicates a breaking change, going to `0.1.3`
> indicates a new feature, and going to `0.1.2+1` indicates a change that doesn't affect the public API.

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
`>=1.4.1 <2.0.0`, while `^0.5.1` means `>=0.5.1 <0.6.0`. Bumping that slot strands every consumer on the old
caret until they hand-edit their pubspec — so bump it only for a genuinely breaking release.

State the proposed version, what in `## Upcoming` drove the classification, and which column you used; then
ask the user to confirm — **they still decide**. If they supply a version that disagrees with the derivation,
say so once, then use theirs.

> There is no undo: pub.dev cannot delete a published version. Get the bump right before merge.

## Pre-flight

Run these checks. **If any fail, stop, surface the failing check to the user, and do not try to auto-fix** (no
stashing uncommitted work, no force-pulling, no killing processes).

- `git status --short -uno` clean after `git checkout main` + `git pull --ff-only`.
- `which melos` and `gh auth status` succeed.
- `gh pr list --head release/v<version> --state all --json number` returns `[]`.
- Latest CI on `main` is green: `gh run list --branch main --limit 5` — no failures on the most recent runs.
- **No `git:` or `path:` entry under `stream_feeds`'s `dependencies`.** pub.dev rejects both, so
  `release_publish.yml` would fail at publish time after the tag is already pushed:

  ```bash
  grep -n -B2 -A4 -E '^\s+(git|path):' packages/stream_feeds/pubspec.yaml melos.yaml
  ```

  A `path:`/`git:` entry under **`dev_dependencies`** is fine — pub ignores those when publishing, and
  `stream_feeds` legitimately dev-depends on `../stream_feeds_test`. Only a real `dependencies` entry blocks.
  In particular check `stream_core`: if it is pinned to a git ref for development, it must be back on a
  published version constraint before release. Surface it and stop — don't pick the constraint yourself.

## Steps

### 1. Branch off main

Pre-flight already left you on `main` with latest. Just create the release branch:

```bash
git checkout -b release/v<version>
```

### 2. Bump the version

**Edit two files by hand:**

- `packages/stream_feeds/pubspec.yaml` — set `version: <version>`.
- `melos.yaml` — in the `command.bootstrap.dependencies` block, set `stream_feeds: ^<version>`. Locate with
  `grep -n '^\s\+stream_feeds:' melos.yaml`. This block is what `docs`, `sample_app`, and the example app
  resolve against.

Do **not** touch the `version:` field in `packages/*/example/pubspec.yaml` or `sample_app/pubspec.yaml` —
those are app versions, and their `stream_feeds` dependency is synced by bootstrap.

**Then run:**

```bash
melos bootstrap
```

This propagates the `melos.yaml` deps block into every workspace pubspec. Do **not** run `melos version`.

Verify the diff shape against the previous release PR:

```bash
gh pr list --search "release in:title" --state merged --limit 5 --json number,title
git diff --stat
gh pr diff <prev-release-pr-number> --name-only   # for comparison
```

### 3. Finalise the CHANGELOG

In `packages/stream_feeds/CHANGELOG.md`, rename the top `## Upcoming` heading to `## <version>`. Keep the
curated bullets exactly as they are — do not add, rewrite, or regenerate them. Sub-headings stay untouched.

The `## <version>` section must be non-empty — pana fails on an empty or missing one.

### 4. Analyze, then commit

```bash
melos run analyze
```

If it fails, surface to the user and stop.

```bash
git status --short          # nothing untracked should be release material
git add -u                  # tracked modifications only
git commit -m "chore(llc): release v<version>"
```

`git add -u`, not `-A`: pre-flight's `git status --short -uno` ignores untracked files, so `-A` would sweep
local artifacts into the release commit. If a release ever needs a genuinely new tracked file, add it by path.

Single commit. **The message format is load-bearing** — `release_tag.yml` parses `vX.Y.Z` out of it, and gates
on the tip commit of `main`, so the PR must be **squash-merged**. A merge commit would leave
`Merge pull request #…` at the tip and the tag job would silently never fire.

`melos run lint:pub` is deliberately **not** in this step: it shells out to `pub publish --dry-run`, which
fails any dirty tree with "N checked-in files are modified in git". It can only pass once the release commit
exists — hence step 5.

### 5. Verify publishability, then push

```bash
melos run lint:pub
```

This is the real publish gate. Read failures carefully — pub reports two severities and only one blocks:

- **"Package validation found the following error"** — blocks. `release_publish.yml` runs `pub publish -f`,
  and `-f` does **not** bypass errors. Must be fixed before merge.
- **"potential issue" / "Package has N warnings"** — `-f` publishes through these. Worth fixing, not blocking.

A common error is a `lib/` or `test/` file importing a package absent from `stream_feeds`'s own
`dependencies` / `dev_dependencies`; it resolves locally through a transitive dep and only `pub publish`
catches it. Fix at the import or by declaring the dep, and tell the user the release PR now carries a source
change.

If it fails, surface to the user and stop — don't push.

```bash
git push -u origin release/v<version>
```

### 6. Generate the PR body

`release_publish.yml` creates the GitHub Release with `generate_release_notes: true`, so the PR body should be
**exactly** what GitHub's release UI produces — no template wrapper, no extra description, no CLA checkboxes.
The "New Contributors" block GitHub auto-appends stays in.

```bash
gh api repos/GetStream/stream-feeds-flutter/releases/generate-notes \
  -f tag_name=v<version> \
  -f previous_tag_name=v<previous> \
  -f target_commitish=main \
  --jq .body > /tmp/release-notes.md
```

- `tag_name`: the tag we'll create (need not exist yet).
- `previous_tag_name`: the most recent tag of the same train.
- `target_commitish`: `main`, not the release branch — the notes should cover every commit between
  `previous_tag_name` and where the tag will land after merge.

Read the file once to skim. If a PR title looks wrong, fix it on the originating PR upstream and re-run the
API call; don't hand-edit `/tmp/release-notes.md`.

### 7. Open the PR

```bash
gh pr create \
  --base main \
  --head release/v<version> \
  --title "chore(llc): release v<version>" \
  --body-file /tmp/release-notes.md
```

Return the PR URL.

**Tell the user to squash-merge it** (see step 4 for why).

## After merge (FYI)

`release_tag.yml` extracts `vX.Y.Z` from the tip commit and pushes the tag with the bot PAT.
`release_publish.yml` fires on that tag push, runs `melos run lint:pub` then `melos run release:pub` (OIDC),
and creates the GitHub Release with generated notes. `--no-published` makes a re-run against a version already
live on pub.dev a clean no-op.

## Don't

- **Never bump the breaking slot without a breaking change** in `## Upcoming` — below `1.0.0` that slot is the
  **minor**, and bumping it strands every consumer on the old caret. See
  [Choosing the version](#choosing-the-version).
- **Never run `melos version`** — it clobbers the hand-curated CHANGELOG.
- **Never create a GitHub release** (`gh release create`, `POST /repos/.../releases`). Step 6 uses
  `generate-notes`, which is read-only; the release itself is created by `release_publish.yml`.
- **Never push a tag** — `release_tag.yml` does it on merge.
- **Never run `melos run release:pub`** — that's the publish step, triggered by the workflow on tag push. Even
  if the user asks, refuse: running it locally publishes from an unreviewed working tree.
- **Never merge the PR.** Return the URL and stop.
