---
name: flutter-version-bump
description: >
  Adopt a new Flutter stable release in this repo — diagnose and fix the analyze, format and build failures a new
  toolchain introduces, then raise the published minimum Dart/Flutter floor to the SDK's "latest stable − 1"
  policy. Use when CI suddenly goes red after a Flutter release, when `dart analyze --fatal-infos` reports
  diagnostics that did not exist before, or when asked to "support Flutter X" or "bump the min Flutter version".
allowed-tools:
  - Bash
  - Read
  - Edit
  - Write
  - Grep
  - Glob
---

# flutter-version-bump

Two different jobs share the phrase "bump Flutter". Decide which one you are doing **before** touching a file —
they produce different diffs, different review burdens, and only one of them changes what consumers can resolve.

| Track | Goal | Scope | Consumer impact |
|---|---|---|---|
| **A — Compat** (first) | Make CI green on the new stable | Source fixes, lint config, Android build floors | None |
| **B — Floor raise** (policy-driven) | Move the minimum to latest − 1 | `melos.yaml` + 6 pubspecs + `legacy_version_analyze.yml` + CHANGELOG + newly-activated lints | Apps below the floor stop resolving |

**Do Track A first, always.** "CI broke after the new Flutter came out" is Track A, and it must land green before
Track B starts — otherwise you cannot tell a floor-raise failure from a new-stable failure. Check before assuming
there is anything to do:

```bash
gh run list --workflow=stream_feeds_flutter_workflow.yml --branch main --limit 5
```

Green on `main` after the release date means the repo already absorbed the new stable and Track A is a no-op.

**Then check whether Track B is due.** The SDK's policy is **minimum supported = latest stable − 1**, so a new
stable makes the floor raise *routine, not exceptional*: when 3.47 shipped, the floor moved 3.38 → **3.44**. Pair
each Flutter minor with its Dart SDK (3.38 → Dart 3.10, 3.44 → Dart 3.12, 3.47 → Dart 3.13); `fvm releases` lists
both, and the authoritative list is
`https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json` (`fvm`'s cache goes stale).

## What a "Flutter floor" actually means here — read this before writing the PR body

**`stream_feeds` is the only published package, and it is pure Dart.** It has no `flutter:` SDK dependency, and
*no pubspec in this repo carries an `environment.flutter` key at all*:

```bash
git ls-files '*pubspec.yaml' | xargs grep -n 'flutter:'   # only `flutter: sdk: flutter` deps, never a constraint
```

So for consumers, **only `environment.sdk` moves**. The Flutter number is a *development and CI* claim — which
toolchain the repo is built, analysed and tested against — carried in `melos.yaml` and
`legacy_version_analyze.yml`, not in anything pub resolves. Say it that way in the CHANGELOG and PR body; do not
copy `stream-chat-flutter`'s "raised minimum Flutter" phrasing, which is true there because its packages are
Flutter packages with real `flutter:` constraints.

Only **two** version knobs move on a floor raise, and they are both the *floor*, never the new stable:

| Knob | Value |
|---|---|
| `melos.yaml` `command.bootstrap.environment.{sdk,flutter}` | the new floor — source of truth, `melos bs` propagates to every pubspec |
| `.github/workflows/legacy_version_analyze.yml` `env.flutter_version` | the new floor — this job *is* the floor's regression test |

> The repo has **no `.fvmrc`** — local Flutter selection is not pinned here. Do not create one as a side effect of
> a version bump; that is its own decision. It does mean nothing forces a developer's local toolchain to be the
> floor, so newer-than-floor API usage is caught only by `legacy_version_analyze` — which covers
> **`packages/stream_feeds` only** (see below). Analyse against the floor by hand.

## Why CI breaks the day a Flutter stable ships

`.github/workflows/stream_feeds_flutter_workflow.yml` installs Flutter with

```yaml
channel: ${{ env.FLUTTER_CHANNEL }}   # stable — no version pin
```

so both jobs (`analyze` and `build`) **auto-adopt the new stable within hours of release**. `pana.yml` pins
`flutter-version: "3.x"`, which does the same thing. `legacy_version_analyze.yml` (the N-1 canary) pins an exact
version and does *not* follow. So the first symptom is always "CI went red and nobody changed anything", while a
local machine on an older SDK still passes.

`melos run analyze` runs `dart analyze --fatal-infos` with `--ignore="*example*"`. New SDKs ship new diagnostics
as **infos and warnings**, which `--fatal-infos` turns into hard failures. That is why an SDK bump hurts here more
than in a typical repo.

### Check the canary first — it usually already told you

`beta_version_analyze.yml` runs the `package_analysis` action against the **beta** channel every Monday and Slacks
on failure. Beta becomes stable roughly a quarter later, so this workflow reports the next release's analyzer
failures *months* early. Before investigating anything, read its history:

```bash
gh run list --workflow=beta_version_analyze.yml --limit 10
gh run view <id> --log-failed | grep -E "warning -|info -|error"
```

Three traps when reading it, all because `.github/actions/package_analysis/action.yml` is a **one-package action**:

```bash
cd packages/stream_feeds/lib && dart analyze --fatal-warnings . && cd .. && flutter test --exclude-tags golden
```

- **It only covers `stream_feeds`.** `stream_feeds_test`, `docs` and `sample_app` are never analysed by the canary
  or by `legacy_version_analyze` — and its `MELOS_PACKAGES: stream_**,example` filter means `docs` and
  `sample_app` are not even bootstrapped there. A green canary says nothing about the Flutter packages.
- **It is `--fatal-warnings`, not `--fatal-infos`,** and `lib/` only. New *infos* — the bulk of what a new SDK
  ships — pass the canary and fail `melos run analyze`.
- **Check the run dates, not just the colours.** GitHub disables `schedule:` triggers after 60 days without repo
  activity, silently. A four-month gap in `gh run list` means the canary was dormant, not passing; treat green
  runs either side of the gap as covering only their own dates.

If the canary has been red and unactioned for weeks, that is the most valuable finding in the exercise — report it
separately from the code fixes.

## Step 1 — Branch off main

Never branch a toolchain bump off a feature branch. Bootstrap rewrites lockfiles repo-wide.

```bash
git fetch origin
git worktree add -b chore/flutter-<version> .claude/worktrees/flutter-<version> origin/main
```

A worktree rather than a checkout: bootstrap rewrites tracked files, and doing that on top of unrelated
in-progress work is how a bump swallows someone else's diff.

**Then check whether a feature branch already did part of the raise.** Feeds is a small repo and constraint edits
migrate onto whatever branch first needed them — a branch that added a dependency requiring a newer Dart may have
bumped the pubspecs without `melos.yaml`, which `melos bootstrap` silently reverts:

```bash
git log --all --oneline -S'sdk: ^3.12.0' -- packages/stream_feeds/pubspec.yaml
```

If one exists, your PR will conflict with it on identical lines. Say so in the PR body; do not try to coordinate
the merge order yourself.

## Step 2 — Install the SDKs side by side

Keep the old one. Every claim below is an A/B comparison, and you cannot make one with a single toolchain.

```bash
fvm install <new>                       # e.g. 3.47.0
fvm list                                # confirm every version you need is cached
```

On a floor raise you want **three**: the old floor (what `legacy_version_analyze` runs today), the new floor (what
it will run — must analyse and test clean) and the latest stable (what CI's `analyze`, `build` and `pana` jobs
actually resolve to).

```bash
OLD=~/fvm/versions/3.38.1      # current floor, from legacy_version_analyze.yml
FLOOR=~/fvm/versions/3.44.0    # new floor
NEW=~/fvm/versions/3.47.0      # latest stable
```

Melos is not on `PATH` per-toolchain — prefix `PATH` with the SDK you are measuring under, and re-activate if
`which melos` comes back empty:

```bash
export PATH="$FLOOR/bin:$PATH" && (which melos || dart pub global activate melos)
```

## Step 3 — Measure before you fix

The single most important habit: **never attribute a failure to the new SDK without seeing the old SDK pass it.**
Repos accumulate drift; a local `build/` directory can inject hundreds of phantom issues. Run each check under
both toolchains and diff.

### Format

CI runs `melos run format:verify` → a bare `dart format --set-exit-if-changed .` from the root, which walks
untracked trees too. Scope to tracked files so `build/` noise cannot pollute the comparison:

```bash
git ls-files '*.dart' > /tmp/dartfiles.txt
for V in $OLD $NEW; do
  echo "== $V"
  $V/bin/cache/dart-sdk/bin/dart format --output=none --set-exit-if-changed $(cat /tmp/dartfiles.txt) 2>&1 | tail -3
done
```

The root `analysis_options.yaml` sets `page_width: 120` and `trailing_commas: preserve`; `dart format` reads it
from the file nearest the target, so always format from the repo root.

Interpretation:

- **Both 0 changed** → the formatter did not change. Do not touch formatting in this PR.
- **New > 0, old = 0** → `dart_style` changed. Apply it as an **isolated commit** touching nothing else, so the
  real fixes stay reviewable.
- **Old > 0, new = 0** → the repo is already formatted for a newer formatter than the floor. Pre-existing drift,
  harmless. Not yours to fix here — but mention it.

### Analyze

> **Run `melos bootstrap` first, and re-run it after every pubspec edit.** `dart analyze` reads the *language
> version* from `.dart_tool/package_config.json`, written by `pub get` — **not** from `pubspec.yaml`. A stale
> `.dart_tool` reports a confidently clean result that CI will not reproduce, and editing an SDK constraint
> without re-bootstrapping changes nothing at all. Verify with:
>
> ```bash
> python3 -c "import json;d=json.load(open('packages/stream_feeds/.dart_tool/package_config.json'));\
> print([p.get('languageVersion') for p in d['packages'] if p['name']=='stream_feeds'])"
> ```
>
> Despite the root `pubspec.yaml` being named `stream_feed_flutter_workspace`, this is **not** a pub workspace —
> no package declares `resolution: workspace`. Melos bootstraps each package separately, so every package has its
> own `.dart_tool/package_config.json` and you must check the one you care about.

Mirror `melos run analyze` (`--fatal-infos`, examples excluded) and **filter local build artifacts**, which are
not in CI and will otherwise bury the real signal:

```bash
set -o pipefail   # otherwise a matching grep masks an analyzer that crashed
for V in $OLD $NEW; do
  echo "##### $V"
  for p in packages/stream_feeds packages/stream_feeds_test docs sample_app; do
    echo "### $p"
    # `|| true` so a package with no diagnostics is not reported as a failure
    (cd "$p" && $V/bin/cache/dart-sdk/bin/dart analyze --fatal-infos . 2>&1 \
      | { grep -E "^\s+(info|warning|error)" | grep -v " build/" || true; })
  done
done
```

That package list *is* `melos run analyze`'s: the `--ignore="*example*"` filter means
`packages/stream_feeds/example` is never analysed by CI, so do not add it and do not fix diagnostics found there.

Everything present under `$NEW` and absent under `$OLD` is your work list. Everything in both is pre-existing —
leave it alone and say so.

### Tests

There are **no goldens and no alchemist** in this repo — nothing depends on it, so `melos run update:goldens`
(gated on `--depends-on="alchemist"`) matches no package and there is no `update_goldens.yml` workflow. Tests are
plain `flutter test`, they pass on macOS, and a non-zero local failure count means a real failure. That removes
the whole Linux-vs-macOS baseline problem that the chat and core repos have.

`melos run test:all` covers `packages/stream_feeds` and `packages/stream_feeds_test` — the only two packages with
a `test/` directory.

```bash
for V in $OLD $NEW; do
  (cd packages/stream_feeds && $V/bin/flutter test --reporter=compact > /tmp/t-$(basename $V).log 2>&1)
done
# compare the failure sets, not the counts — `\r` matters, the compact reporter uses it
for V in $OLD $NEW; do
  tr '\r' '\n' < /tmp/t-$(basename $V).log | grep -E '\[E\]$' | sed 's|.*/test/|test/|' | sort -u \
    > /tmp/fail-$(basename $V).txt
done
comm -13 /tmp/fail-$(basename $OLD).txt /tmp/fail-$(basename $NEW).txt   # caused by the new SDK
comm -12 /tmp/fail-$(basename $OLD).txt /tmp/fail-$(basename $NEW).txt   # pre-existing, out of scope
```

## Step 4 — Fix, by failure class

Work the diff from Step 3. Known classes and this repo's chosen remedy:

### New analyzer diagnostics (the usual bulk)

New SDKs add diagnostics that `--fatal-infos` promotes to failures. Treat each as a real finding first — most of
them point at a genuine latent bug — and only suppress when the diagnostic is wrong about this code.

| Remedy | When |
|---|---|
| Fix the code | Default. The diagnostic is usually right. |
| `// ignore: <name>` with a one-line reason above it | The diagnostic is correct in general but wrong here, or the fix belongs to an upstream package. Never a bare ignore. |
| Flip the rule to `false` in `analysis_options.yaml`, or delete it from `all_lint_rules.yaml` | The lint was **removed or renamed** by the SDK. An unrecognized rule name is itself a warning. |

The lint config here is inverted relative to most repos: `all_lint_rules.yaml` is an **explicit list of every
rule**, included wholesale, and `analysis_options.yaml` then switches individual rules back to `false` with a
comment saying why. Two consequences:

- **A new SDK's new rules do not activate on their own.** The list is static, so adopting them means adding the
  names to `all_lint_rules.yaml` — a code-style decision with its own before/after numbers, and **always its own
  PR**, never this one.
- **A removed or renamed rule fires `undefined_lint` in `all_lint_rules.yaml`, not in `analysis_options.yaml`.**
  Delete it there; if `analysis_options.yaml` also disables it, delete that line too or it becomes the next
  `undefined_lint`.

To find removed/renamed/deprecated lints mechanically rather than by guessing, analyse the options files
themselves — `melos run analyze` never does, because both sit at the repo **root**, outside every melos package:

```bash
for V in $OLD $NEW; do
  echo "== $V"; $V/bin/cache/dart-sdk/bin/dart analyze --fatal-infos analysis_options.yaml all_lint_rules.yaml
done
```

`undefined_lint` means the rule was removed or renamed — a hard failure once the root is analysed.
`deprecated_lint` means it still parses but is on its way out — cheaper to drop now than to discover as
`undefined_lint` two releases later. Run it under both toolchains: a `deprecated_lint` that also fires on the old
SDK is pre-existing debt, not something this release introduced.

### Framework deprecations

New `deprecated_member_use` infos are fatal here. Prefer migrating to the replacement API. If the replacement does
not exist on the floor in `melos.yaml`, you cannot use it — suppress with a scoped ignore naming the reason, and
leave the migration for the release that raises the floor.

### New runtime assertions

Flutter adds asserts that only fire in tests, so they surface as widget-test failures, not analyzer output. Read
the assertion and fix the widget tree; do not silence the test.

### Android build floors — this repo *does* have a build job

`stream_feeds_flutter_workflow.yml`'s `build` job runs **Build APK** on `sample_app`, so Gradle / AGP / Kotlin
floors **can** gate a PR here. (There is no iOS build job; iOS build-tool floors are invisible in CI.) Every
Flutter release raises those floors, and the check is **fail-fast** — it reports only the first violated floor, so
fixing one commonly just reveals the next. Read all of them out of the SDK up front instead of iterating through
CI:

```bash
grep -n "Version(" $NEW/packages/flutter_tools/gradle/src/main/kotlin/DependencyVersionChecker.kt | head
```

Each tool has an `error…Version` (hard floor, fails the build) and a `warn…Version` (deprecation only). But the
release notes also publish an **"Android dependency matrix"** — the combination Flutter actually tested. Prefer
the verified matrix over the bare floors: the floors only tell you what will not be rejected, while the matrix is
what the release was exercised against, and it is where the *next* release's floors will land. The matrix is
internally constrained (a given AGP is only compatible with certain KGP and Gradle versions), so move Gradle, AGP
and KGP together or not at all. Set them in `sample_app/android/gradle/wrapper/gradle-wrapper.properties` and
`sample_app/android/settings.gradle`.

Prefer the SDK's API-level variables (`flutter.compileSdkVersion`, `targetSdkVersion`, `minSdkVersion`) over
hardcoded numbers in `sample_app/android/app/build.gradle`, so future releases carry the project forward
automatically.

**This is a Track A concern, not Track B.** The build job installs `channel: stable` regardless of the floor, so
raising the floor cannot change which Gradle it needs. Do not touch Gradle files in a floor-raise PR.

**Validate locally — you probably can.** `flutter doctor` showing a working Android toolchain means
`(cd sample_app && flutter build apk --release)` reproduces the CI `build` job in one shot, instead of
5-minute CI round trips per attempt. Only fall back to "unverifiable locally" if the toolchain is genuinely
missing — and if so, **say so** rather than implying the branch is fully green.

### Files the toolchain rewrites underneath you

`melos bootstrap` and `flutter pub get` both edit tracked files. Sort them before committing:

- **`sample_app/{linux,windows}/flutter/generated_plugins.cmake`** — regenerated from the resolved plugin set, so
  they move whenever a transitive dependency gains or drops an FFI plugin. **Unrelated to a version bump.** Check
  whether they are already dirty on other branches before attributing them to your change, and leave them out of
  the commit. `melos run format:verify` only checks `.dart`, and no job diffs the tree after bootstrap, so cmake
  drift cannot fail CI here — it is noise, not a gate.
- **`pubspec.lock`** — only the root lock is tracked (`git ls-files '*pubspec.lock'` to confirm). Commit it.
- **`analyzer.exclude` blocks injected into an app-type `analysis_options.yaml`** — Flutter 3.47's `pub get`
  writes `build/`, `android/`, `ios/`, … exclusions into packages that have a `flutter:` SDK dep *and* platform
  directories. It did **not** happen under 3.44 here; re-check under whichever stable you are on. It is
  tool-authored config, not ours. **Surface it, do not decide it yourself** — and note that `pub get` *merges*
  its full list into any existing `exclude:`, so a hand-trimmed version is not a stable fixed point.
- **`test_api: any` / `flutter_test: any` appended to `dev_dependencies`** — melos injects these around bootstrap
  and normally strips them again. **Never commit them**: `flutter_test` has no pub.dev version, so committing it
  makes the next `melos bootstrap` fail version solving outright.

## Step 5 — Verify like CI does

```bash
melos bootstrap
melos run analyze
melos run format:verify
melos run test:all
git status --short          # expect only your intended edits
```

`melos run analyze` surfaces `build/` noise if you have ever built the sample app. Compare against Step 3's
baseline instead of expecting a clean zero.

Also re-check the floor, since `legacy_version_analyze.yml` gates the PR — and remember it covers `stream_feeds`
only, so extend it by hand to the packages it misses:

```bash
for p in packages/*/; do (cd "$p/lib" && $FLOOR/bin/cache/dart-sdk/bin/dart analyze --fatal-infos .); done
```

A fix that relies on syntax newer than the floor passes on `$NEW` and fails that job.

`pana.yml` gates on a **min score of 120** for `packages/stream_feeds`. A raised SDK constraint is not penalised,
but a malformed one is — run it if you touched the pubspec in any way beyond the constraint bump.

## Step 6 — Track B: raise the floor to latest − 1

Keep this out of the Track A commit — it changes what consumers can resolve and needs to be reviewable on its own.

Version-carrying files. **Derive the list by grep, do not trust this one** — it is accurate as of the 3.44 raise:

```bash
git ls-files '*pubspec.yaml' | xargs grep -ln 'sdk: \^3\.'
```

- `melos.yaml` — `command.bootstrap.environment.{sdk,flutter}` (the source of truth; `melos bs` propagates)
- `pubspec.yaml` (root workspace) — `environment.sdk`
- `packages/stream_feeds/pubspec.yaml` — the only published package, **pure Dart**
- `packages/stream_feeds/example/pubspec.yaml`
- `packages/stream_feeds_test/pubspec.yaml`
- `docs/pubspec.yaml`
- `sample_app/pubspec.yaml`
- `.github/workflows/legacy_version_analyze.yml` — `env.flutter_version`. Set it to the **new floor** (never the
  new stable): this job exists to prove the floor still analyses and tests clean. The existing value may be a
  *patch* of the floor (`3.38.1` for a `>=3.38.0` floor) — pick one convention and say which in the commit
  message.

Confirm melos actually propagated rather than assuming it:

```bash
melos bootstrap && git diff --stat -- '*pubspec.yaml'
```

**Melos only rewrites keys that already exist.** No pubspec here has an `environment.flutter` key, so the
`flutter:` half of `melos.yaml`'s environment block propagates *nowhere*. That is correct and intended — see the
"What a Flutter floor actually means here" section — but it means `git diff` after bootstrap will show `sdk:`
changes only. Do not read that as a failed propagation, and do not hand-add `flutter:` keys to make the diff look
symmetrical.

### The floor raise activates dormant lints — budget for it

This is the step that surprises people. Raising the Dart constraint raises each package's **language version**,
and lints stay silent while their suggested fix is not yet expressible. Raise the floor and they all fire at once,
in code nobody touched.

Concretely, the Dart 3.10 → 3.12 raise activates `prefer_initializing_formals`, because Dart 3.12 legalised
`this._privateField` as a named parameter. Zero issues before, a pile after — none of it caused by the new
*stable*, all of it caused by the *floor*. The same raise hit `stream-core-flutter` on 24 sites and
`stream-chat-flutter` on 29; treat any count as a measurement, not a prediction.

So: **`melos bootstrap` and re-analyse immediately after editing the constraints**, before you write the
CHANGELOG. Then let the tooling do the mechanical work:

```bash
for p in packages/*/ docs sample_app; do (cd $p && dart fix --dry-run); done
# then, per lint, once you have decided the fix is right:
(cd <pkg> && dart fix --apply --code=prefer_initializing_formals)
```

Two things to check by hand afterwards — `dart fix` is mechanical, not thoughtful:

- **Doc comments get mangled *and silently deleted*.** It rewrites `[logger]` to `[_logger]` in the doc above the
  constructor — leaking a private name into public API docs, when callers still pass the *public* name
  (`logger:`, underscore stripped). It also drops any `///` comment attached to the parameter it rewrites. Review
  every comment line the refactor touched, in both directions:

  ```bash
  git diff -- '*.dart' | grep -E "^[-+]\s*(///|//)"
  ```

  Checking only added lines misses the deletions — that is how a lost doc comment survives review.
- **Confirm no public parameter was renamed.** For every `this._foo` it introduced, the parameter it replaced must
  have been named exactly `foo`. A mismatch is a silent breaking change for callers of a published package.

This repo generates heavily (`freezed`, `json_serializable`, `retrofit_generator`, plus `injectable` and
`auto_route` in the sample app). Re-run `melos run generate:all` afterwards and confirm the generated call sites
are unchanged — the generators read constructor parameters, so a renamed parameter would silently change `.g.dart`
/ `.freezed.dart`.

**Always `dart format` after build_runner.** Generated files are emitted at dart_style's default 80 columns while
the repo's `analysis_options.yaml` sets `page_width: 120`, so a regen can dirty generated files with pure reflow.
Format before concluding codegen "changed" anything. Note the analyzer `exclude` covers
`packages/*/lib/**/*.*.dart` and `packages/stream_feeds/lib/src/generated/**`, so generated files are not analysed
— but they *are* formatted.

### The CHANGELOG bullet

Per `AGENTS.md`, `packages/stream_feeds/CHANGELOG.md` is **hand-curated** and new entries go under the top
`## Upcoming` heading, never into an already-published version's section. If there is no `## Upcoming` section
(the package was just released), add one at the top. Do not run `melos version`.

`stream_feeds` is Dart-only, so the bullet names the **Dart SDK**:

```md
- Raised the minimum Dart SDK to `^3.12.0`
```

Two judgement calls the other repos settle differently — decide deliberately:

- **Is it breaking?** `stream-chat-flutter` and `stream-core-flutter` both say **no**: existing code keeps
  compiling, older SDKs simply stop resolving the new version, so no `!` in the title and no breaking bucket. But
  this repo's own `## Upcoming` has previously filed exactly this bullet under `### [BREAKING]`. Follow whatever
  the section already in flight does, and if you are starting the section, follow the chat/core precedent —
  it is the one the release tooling and semver expectations assume.
- **Which heading?** This CHANGELOG's headings are free-form per release (`### New fields`,
  `### WebSocket events`, `### [BREAKING]`), not a fixed emoji set. Match the section you are writing into rather
  than importing chat's `### 🔄 Changed`.

`pr_title.yml`'s `semantic_changelog_update` maps the scope `llc` to `packages/stream_feeds`. A `chore(repo):` PR
is outside that map and is therefore not *required* to touch the changelog — but a floor raise is consumer-visible
and should have the bullet anyway.

### Sweep what the new floor unblocks

Still in Track B, after the constraints move. Suppressions in `analysis_options.yaml` carry `TODO` comments naming
the version that makes them removable:

```bash
grep -n "TODO" analysis_options.yaml all_lint_rules.yaml
```

As of the 3.44 raise, `omit_obvious_property_types: false` is tagged
`# TODO: Remove once we remove support for flutter 3.27.4` — already stale at the 3.38 floor. Re-enabling a lint
is a **code-style decision with its own diff**, so surface it as a follow-up rather than folding it in; but do not
leave the stale TODO unmentioned.

Finish with `melos bootstrap` and commit the resulting root `pubspec.lock`.

## Step 7 — PR

PR title follows Conventional Commits with a **required scope** from `llc` / `repo` / `samples`
(`pr_title.yml` enforces `requireScope: true`):

- Track A → `chore(repo): support Flutter <version>`
- Track B → `chore(repo): raise the minimum Dart SDK to <version>`

Name the Dart SDK in a Track B title, not Flutter — that is the constraint consumers resolve against, and the one
the diff actually changes in every pubspec.

Keep the skill file itself, if you are editing it, in **its own commit** — same rule this skill applies to
everything else.

## Report back with attribution

When summarising, always separate the three buckets — it is the difference between a reviewable PR and a mystery:

1. **Caused by the floor raise** (fires only after the constraint moves) — what this PR fixes.
2. **Pre-existing** (present before and after) — explicitly out of scope, named so nobody re-investigates.
3. **Local-only noise** (`build/` artifacts, `generated_plugins.cmake` churn) — never gates CI, never fix.

Say plainly what you could not verify. Here that is a short list, but `legacy_version_analyze` and the beta canary
covering only `packages/stream_feeds` means "the canary is green" is a much weaker claim than it sounds.
