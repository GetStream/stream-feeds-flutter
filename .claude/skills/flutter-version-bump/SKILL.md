---
name: flutter-version-bump
description: >
  Adopt a new Flutter stable release in a Stream Flutter monorepo — diagnose and fix the analyze, format, golden
  and build failures a new toolchain introduces, then raise the published minimum Dart/Flutter floor to the SDK's
  "latest stable − 1" policy. Use when CI suddenly goes red after a Flutter release, when
  `dart analyze --fatal-infos` reports diagnostics that did not exist before, when goldens drift after upgrading,
  or when asked to "support Flutter X" or "bump the min Flutter version".
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
| **A — Compat** (first) | Make CI green on the new stable | Source fixes, lint config, goldens, build-tool floors | None |
| **B — Floor raise** (policy-driven) | Move the minimum to latest − 1 | Version knobs + every pubspec + CHANGELOGs + newly-activated lints | Apps below the floor stop resolving |

**Do Track A first, always.** "CI broke after the new Flutter came out" is Track A, and it must land green before
Track B starts — otherwise you cannot tell a floor-raise failure from a new-stable failure. Check whether there is
anything to do rather than assuming:

```bash
gh run list --workflow=<main workflow>.yml --branch <default branch> --limit 5
```

Green after the release date means the repo already absorbed the new stable and Track A is a no-op.

**Then check whether Track B is due.** The policy is **minimum supported = latest stable − 1**, so a new stable
makes the floor raise *routine, not exceptional*. Pair each Flutter minor with the Dart SDK it ships. Do not
recall the pairing — `fvm`'s cache goes stale, so read the authoritative list:

```bash
curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json \
  | python3 -c "import json,sys; d=json.load(sys.stdin); [print(r['version'],'-> Dart',r.get('dart_sdk_version'),r['release_date'][:10]) for r in d['releases'] if r['channel']=='stable'][:8]"
```

Track B belongs in a minor/major release rather than a hotfix, and must be its own commit — its diff has nothing
to do with the compat fixes.

## Step 0 — Learn this repo's shape before you plan

These repos differ in exactly the ways that change the procedure. **Derive each fact; never carry an assumption
across repos.** Ten commands, and they determine everything downstream:

```bash
# 1. Which packages exist, which are published, which are pure Dart
git ls-files '*pubspec.yaml' | xargs grep -l . | head -30
grep -l 'publish_to: none' $(git ls-files '*pubspec.yaml')          # private
grep -rL 'sdk: flutter' $(git ls-files 'packages/*/pubspec.yaml')   # pure Dart → Dart-only floor

# 2. The version knobs. Not every repo has all three.
ls .fvmrc 2>/dev/null                                    # some repos pin local Flutter, some do not
grep -n 'environment:' -A3 melos.yaml                    # source of truth; `melos bs` propagates
grep -rn 'flutter.version\|flutter-version' .github/workflows/

# 3. Which jobs auto-adopt the new stable, and which pin
grep -rn 'channel:\|flutter-version:' .github/workflows/ .github/actions/

# 4. Lint config style — allowlist or denylist (decides where a removed rule fires)
ls all_lint_rules.yaml 2>/dev/null && echo "inverted: all_lint_rules.yaml is the list"

# 5. Goldens or not
grep -rn 'alchemist' $(git ls-files '*pubspec.yaml') | head

# 6. PR title scopes the CI enforces
grep -n 'scopes:' -A8 .github/workflows/pr_title.yml 2>/dev/null

# 7. The changelog convention
ls STYLE_GUIDE.md AGENTS.md CLAUDE.md 2>/dev/null
```

Four splits matter most, because each one silently invalidates advice written for a sibling repo:

| Question | Why it changes the work |
|---|---|
| **Is the published package pure Dart?** | If it has no `flutter:` SDK dep and no `environment.flutter` key, then **only `environment.sdk` moves for consumers**. The Flutter number is a dev/CI claim. Word the CHANGELOG and PR body that way. |
| **Are there goldens?** | No alchemist → no Linux-vs-macOS baseline noise, and a non-zero local failure count is a real failure. With goldens, see the golden section — never regenerate locally. |
| **Are there Android/iOS build jobs?** | If yes, a release's raised Gradle/AGP/Kotlin floors gate PRs. If no, they are invisible until someone builds locally — say so rather than implying the platform projects are verified. |
| **Is there a `.fvmrc`?** | If yes it is a third knob and moves with the floor. If not, nothing forces a developer's toolchain to be the floor — do not create one as a side effect of a bump; that is its own decision. |

The version knobs all carry the **floor**, never the new stable:

| Knob | Value | Present in |
|---|---|---|
| `melos.yaml` `command.bootstrap.environment` | new floor — source of truth | all |
| `.fvmrc` | new floor — local dev builds against the minimum | some |
| legacy/N-1 workflow's `flutter_version` | new floor — this job *is* the floor's regression test | all |

## Why CI breaks the day a Flutter stable ships

Workflows that install Flutter with an unpinned `channel: stable` — or `flutter-version: "3.x"` — **auto-adopt the
new stable within hours of release**. The N-1 canary pins an exact version and does *not* follow. So the first
symptom is always "CI went red and nobody changed anything", while local machines still pass.

`melos run analyze` typically runs `dart analyze --fatal-infos`. New SDKs ship new diagnostics as **infos and
warnings**, which `--fatal-infos` turns into hard failures. That is why an SDK bump hurts here more than in a
typical repo.

### Check the beta canary first — it usually already told you

A weekly `beta_version_analyze.yml` runs against the **beta** channel and Slacks on failure. Beta becomes stable
roughly a quarter later, so it reports the next release's analyzer failures *months* early:

```bash
gh run list --workflow=beta_version_analyze.yml --limit 10
gh run view <id> --log-failed | grep -E "warning -|info -|error"
```

Three traps, all of which apply wherever the canary delegates to a shared `package_analysis` action — **read that
action**, since its coverage is narrower than the name suggests:

- **It usually analyses one package.** Sibling packages are not covered by it or by the N-1 job. A green canary
  says much less than it appears to.
- **It may be `--fatal-warnings`, not `--fatal-infos`,** and `lib/` only. New *infos* — the bulk of what a new SDK
  ships — pass the canary and fail `melos run analyze`. It also rarely runs golden tests.
- **Check run dates, not just colours.** GitHub disables `schedule:` triggers after 60 days without repo activity,
  silently. A months-long gap means dormant, not passing.

If the canary has been red and unactioned for weeks, that is the most valuable finding in the exercise — report it
separately from the code fixes.

## Step 1 — Branch off the default branch

Never branch a toolchain bump off a feature branch. Bootstrap rewrites lockfiles repo-wide.

```bash
git fetch origin
git worktree add -b chore/flutter-<version> .claude/worktrees/flutter-<version> origin/<default branch>
```

A worktree rather than a checkout: bootstrap rewrites tracked files, and doing that on top of unrelated
in-progress work is how a bump swallows someone else's diff.

**Then check whether a feature branch already did part of the raise.** Constraint edits migrate onto whatever
branch first needed them, and a branch that bumped pubspecs *without* `melos.yaml` will have its work silently
reverted by the next `melos bootstrap`:

```bash
git log --all --oneline -S'sdk: ^<new dart>' -- '*pubspec.yaml'
```

If one exists, your PR will conflict with it on identical lines. Say so in the PR body; do not try to coordinate
merge order yourself.

## Step 2 — Install the SDKs side by side

Keep the old one. Every claim below is an A/B comparison, and you cannot make one with a single toolchain.

```bash
fvm install <new> && fvm list
OLD=~/fvm/versions/<current floor>     # what the N-1 job runs today
FLOOR=~/fvm/versions/<new floor>       # what it will run — must be clean
NEW=~/fvm/versions/<latest stable>     # what unpinned CI jobs resolve to
```

On a floor raise you want all **three**. Melos is not on `PATH` per-toolchain — prefix `PATH` with the SDK you are
measuring under, and re-activate if `which melos` comes back empty:

```bash
# `dart pub global activate` installs into the pub cache, which is not on PATH by default —
# add it up front or the melos you just activated still will not resolve.
export PATH="$FLOOR/bin:$HOME/.pub-cache/bin:$PATH"
which melos || dart pub global activate melos
```

## Step 3 — Measure before you fix

The single most important habit: **never attribute a failure to the new SDK without seeing the old SDK pass it.**
Repos accumulate drift; a local `build/` directory can inject hundreds of phantom issues. Run each check under
both toolchains and diff.

### Format

Scope to **tracked** files so untracked trees cannot pollute the comparison:

```bash
git ls-files '*.dart' > /tmp/dartfiles.txt
for V in $OLD $NEW; do
  echo "== $V"
  $V/bin/cache/dart-sdk/bin/dart format --output=none --set-exit-if-changed $(cat /tmp/dartfiles.txt) 2>&1 | tail -3
done
```

`dart format` reads `page_width` / `trailing_commas` from the analysis options file **nearest the target**, so
always format from the repo root.

- **Both 0 changed** → the formatter did not change. Do not touch formatting in this PR.
- **New > 0, old = 0** → `dart_style` changed. Apply as an **isolated commit** touching nothing else. A tall-style
  change can reformat hundreds of files and is the whole PR on its own.
- **Old > 0, new = 0** → the repo is already formatted for a newer formatter than the floor. Pre-existing drift,
  usually harmless because N-1 jobs analyse but never format. Mention it — on a floor raise it is an argument
  *for* the change.

### Analyze

> **Run `melos bootstrap` first, and re-run it after every pubspec edit.** `dart analyze` reads the *language
> version* from `.dart_tool/package_config.json`, written by `pub get` — **not** from `pubspec.yaml`. A stale
> `.dart_tool` reports a confidently clean result that CI will not reproduce, and editing an SDK constraint
> without re-bootstrapping changes nothing at all. Verify with:
>
> ```bash
> python3 -c "import json;d=json.load(open('<pkg>/.dart_tool/package_config.json'));\
> print([p.get('languageVersion') for p in d['packages'] if p['name']=='<pkg name>'])"
> ```
>
> A root `pubspec.yaml` named `*_workspace` is **not** necessarily a pub workspace — check for
> `resolution: workspace`. Without it, melos bootstraps each package separately and every package has its own
> `package_config.json`; check the one you care about.

Mirror the repo's own analyze script — including its ignore filters, so you do not fix diagnostics CI never sees —
and **filter local build artifacts**:

```bash
for V in $OLD $NEW; do
  echo "##### $V"
  for p in <the packages the analyze script actually covers>; do
    echo "### $p"
    out=$(cd "$p" && $V/bin/cache/dart-sdk/bin/dart analyze --fatal-infos . 2>&1); st=$?
    # dart analyze exits 0 clean, 1/2/3 for error/warning/info. Anything else is the
    # analyzer itself failing — which prints nothing the grep matches and so reads as
    # "clean". Surface it instead of banking a false negative.
    [ "$st" -gt 3 ] && { echo "!! analyzer failed (exit $st)"; printf '%s\n' "$out" | tail -5; }
    printf '%s\n' "$out" | grep -E "^\s+(info|warning|error)" | grep -v " build/" || true
  done
done
```

Everything present under `$NEW` and absent under `$OLD` is your work list. Everything in both is pre-existing —
leave it alone and say so.

### Tests and goldens

**If the repo has no alchemist dependency, skip the golden machinery entirely** — tests are plain `flutter test`,
they pass locally, and a non-zero failure count is a real failure.

If it does have goldens, find the env var its `flutter_test_config.dart` switches on — repos differ between `CI`
and `GITHUB_ACTIONS`, and **guessing wrong silently runs the platform variant**, whose goldens are usually not
committed, failing tests that have nothing to do with the new SDK:

```bash
grep -rn 'Platform.environment' $(git ls-files '*flutter_test_config.dart')
```

Then compare failure **sets**, not counts — the compact reporter uses `\r`. Run this for **every** package with a
`test/` directory, not just the headline one — the repo's `test:all` covers them all, so a single-package loop
reports a clean upgrade while a sibling still fails:

> Use `while read`, not `for pkg in $PKGS`. **zsh does not word-split unquoted scalar expansions**, so a `for`
> loop over a captured multi-line list runs *once*, with every path glued into one argument — it looks like it
> worked and silently tests nothing. (Unquoted *command substitution* does split in both shells; scalars do not.)

```bash
for V in $OLD $NEW; do
  v=$(basename $V); : > /tmp/fail-$v.txt
  # every package that has tests at all — not just the headline one
  git ls-files '*pubspec.yaml' | xargs -n1 dirname | sort -u | while read -r pkg; do
    [ -d "$pkg/test" ] || continue
    (cd "$pkg" && <ENVVAR>=true $V/bin/flutter test --reporter=compact) > /tmp/t-$v-$(basename $pkg).log 2>&1
    # prefix each failure with its package, so two packages cannot collide in the set
    tr '\r' '\n' < /tmp/t-$v-$(basename $pkg).log | grep -E '\[E\]$' \
      | sed "s|.*/test/|$pkg/test/|" >> /tmp/fail-$v.txt
  done
  sort -u -o /tmp/fail-$v.txt /tmp/fail-$v.txt
done

comm -13 /tmp/fail-$(basename $OLD).txt /tmp/fail-$(basename $NEW).txt   # caused by the new SDK
comm -12 /tmp/fail-$(basename $OLD).txt /tmp/fail-$(basename $NEW).txt   # pre-existing, out of scope
```

Committed goldens are Linux-rendered, so some fail on macOS even on the old SDK. That baseline noise is exactly
what `comm` separates out. **Only the lines the new SDK adds are yours.**

> **Never run `git checkout -- .` between runs.** Alchemist only writes untracked `failures/*.png` directories, so
> there is nothing to revert — and a blanket checkout silently destroys the source fixes you just made. Clean up
> with `git clean -fd -- '*/failures'` instead.

## Step 4 — Fix, by failure class

### New analyzer diagnostics (the usual bulk)

Treat each as a real finding first — most point at a genuine latent bug — and only suppress when the diagnostic is
wrong about this code.

| Remedy | When |
|---|---|
| Fix the code | Default. The diagnostic is usually right. |
| `// ignore: <name>` with a one-line reason above it | Correct in general but wrong here, or the fix belongs upstream. Never a bare ignore. |
| Remove/disable the rule in the lint config | The lint was **removed or renamed** by the SDK. An unrecognized rule name is itself a warning. |

**Where a removed rule fires depends on the config style**, which is why Step 0 checks for `all_lint_rules.yaml`:

- **Inverted (allowlist) config** — `all_lint_rules.yaml` lists every rule and is included wholesale;
  `analysis_options.yaml` switches individual rules back to `false`. A removed rule fires `undefined_lint` **in
  `all_lint_rules.yaml`**; delete it there, and delete any matching `false` line too or it becomes the next one.
  A new SDK's new rules **do not activate on their own** here — adopting them is a separate, deliberate PR.
- **Plain denylist config** — delete the rule from `analysis_options.yaml`.

Either way, analyse the options files *themselves*. `melos run analyze` never does, because they sit at the repo
root, outside every melos package:

```bash
for V in $OLD $NEW; do
  echo "== $V"; $V/bin/cache/dart-sdk/bin/dart analyze --fatal-infos analysis_options.yaml all_lint_rules.yaml
done
```

`undefined_lint` / `removed_lint` means the rule is gone. `deprecated_lint` means it still parses but is on its
way out — cheaper to drop now than to discover two releases later. Run under both toolchains: one that also fires
on the old SDK is pre-existing debt. **Note whether anything in CI actually analyses these files** — often nothing
does, which makes this a follow-up rather than a blocker.

### New *lint rules* are a separate PR — never this one

Distinguish two things a new SDK brings, and do not let them share a branch:

- **New diagnostics that fire on their own.** These break CI whether you like it or not. Fix them here.
- **New lint rules you could opt into.** A code-style decision with its own before/after numbers — **always its
  own PR.**

Worth measuring each candidate's violation count before proposing it. Two findings that generalise:

- **A rule with zero violations may just be dormant.** Lints stay silent while their fix is not expressible at the
  current language version. Enabling a dormant rule schedules a surprise repo-wide diff for whoever raises the
  floor next.
- Rules the floor's analyzer does not recognise are **silently ignored** there, not errors — so adopting a
  new-SDK-only rule will not break the N-1 job; it just is not enforced on the floor.

### Framework deprecations

New `deprecated_member_use` infos are fatal under `--fatal-infos`. Prefer migrating to the replacement API. If the
replacement does not exist on the floor, you cannot use it — suppress with a scoped ignore naming the reason, and
leave the migration for the release that raises the floor.

### New runtime assertions

Flutter adds asserts that only fire in tests, so they surface as widget-test failures, not analyzer output. Read
the assertion and fix the widget tree; do not silence the test.

### Golden pixel drift

Small diffs (well under 1%) across unrelated widgets mean the engine's rasterisation changed — legitimate, and the
goldens must be regenerated. Larger diffs confined to one widget family usually mean a real layout change;
investigate before regenerating. **On a Track B floor raise, goldens should not move at all** — CI still runs the
latest stable either way. If they do, investigate rather than regenerate.

**Goldens are always regenerated by the CI workflow — never locally. No exceptions.** A local update writes the
*platform* variant (macOS pixels); the committed ones are Linux-rendered. Locally you may **compare** — never
write.

> **Confirm with the user before dispatching the regeneration workflow.** It pushes a branch and writes a commit
> to the remote using a bot key. It is the one outward-facing action in this skill — never dispatch it unprompted,
> and expect the branch to stay red on goldens until it has run.

```bash
git push -u origin chore/flutter-<version>
gh workflow run update_goldens.yml --ref chore/flutter-<version>
gh run watch $(gh run list --workflow=update_goldens.yml --limit 1 --json databaseId --jq '.[0].databaseId')
git pull
```

Two consequences to state plainly: the branch is **not verifiable-green on macOS** even after regeneration (give
the reviewer the pre-existing baseline number), and N-1 jobs never run golden tests, so regenerating against the
new stable cannot break the canary.

### Android / iOS build floors — only if the repo has build jobs

Every Flutter release raises its Gradle / AGP / Kotlin floors, and the check is **fail-fast** — it reports only
the first violated floor, so fixing one commonly reveals the next. Read all of them up front instead of iterating
through CI:

```bash
grep -n "Version(" $NEW/packages/flutter_tools/gradle/src/main/kotlin/DependencyVersionChecker.kt | head
```

Each tool has an `error…Version` (hard floor) and a `warn…Version` (deprecation only). The release notes also
publish an **"Android dependency matrix"** — the combination Flutter actually tested. Prefer the verified matrix
over the bare floors: the floors say what will not be rejected, the matrix is what was exercised, and it is where
the *next* release's floors land. The matrix is internally constrained, so move Gradle, AGP and KGP together or
not at all. Prefer the SDK's API-level variables (`flutter.compileSdkVersion`, …) over hardcoded numbers.

**This is Track A, not Track B** — build jobs install the latest stable regardless of the floor, so raising the
floor cannot change which Gradle they need. Do not touch Gradle files in a floor-raise PR.

**Validate locally if you can.** A working Android toolchain means one `flutter build apk --release` reproduces
the CI job, instead of 5-minute round trips. If you genuinely cannot, **say so** rather than implying green.

### Files the toolchain rewrites underneath you

`melos bootstrap` and `flutter pub get` both edit tracked files. Sort them into "commit" and "never commit" —
getting this wrong either breaks CI or leaves everyone with a permanently dirty tree.

| What | Verdict |
|---|---|
| `pubspec.lock` | Commit. Check `git ls-files '*pubspec.lock'` — some repos track only the root. |
| `generated_plugins.cmake`, `.flutter-plugins-dependencies` | Regenerated from the resolved plugin set; move when a transitive dep gains/drops a plugin. **Unrelated to a version bump** — leave out. Check whether they are already dirty on other branches before attributing them to your change. |
| `analyzer.exclude` block injected into an app-type `analysis_options.yaml` | **Tool-authored, not ours. Surface it, do not decide it.** Newer Flutter `pub get` writes `build/`, `android/`, `ios/`, … into packages with a `flutter:` SDK dep *and* platform dirs. Note `pub get` **merges** its full list into any existing `exclude:`, so a hand-trimmed version is not a stable fixed point. |
| `test_api: any` / `flutter_test: any` in `dev_dependencies` | **Never commit.** Melos injects these around bootstrap and normally strips them; `flutter_test` has no pub.dev version, so committing it makes the next bootstrap fail version solving outright. |

Whether leftovers actually break CI depends on the repo: some run a script that fails on `git ls-files --modified`
after bootstrap, others only check `.dart` formatting. Check before treating cmake churn as a gate.

## Step 5 — Verify like CI does

Run the repo's own scripts, not your per-package loop — those are the actual gate:

```bash
melos bootstrap
melos run analyze
melos run format:verify        # or `melos run format` + the repo's validate script
melos run check:barrels        # only where it exists
<ENVVAR>=true melos run test:all
git status --short              # expect only your intended edits
```

Two things will look wrong locally and are not: analyze surfaces `build/` noise if you have ever built an app
(compare against Step 3's baseline, not against zero), and a bare `dart format .` can **crash** on stale
`build/**/SourcePackages/**` checkouts — a local artifact CI never has. Remove the build dir rather than
concluding the repo is unformatted.

Also re-check the floor, since the N-1 job gates the PR — and extend it by hand to the packages it misses.
**Cover every package whose constraint you moved, not just `packages/*`:** apps and docs packages sit outside
that glob, and a `packages/*/`-only loop reports a clean upgrade while a changed package still fails. Derive the
list from the diff so it cannot drift from what you actually edited:

```bash
# every package whose pubspec this PR touched
for f in $(git diff --name-only origin/<default branch>... -- '*pubspec.yaml'); do
  p=$(dirname "$f")
  [ "$p" = "." ] && continue                # workspace root carries no source of its own
  # prefer lib/ (what the N-1 job analyses), but fall back to the package root —
  # not every package keeps its Dart in lib/, and skipping on a missing lib/ quietly
  # drops a package whose constraint you just moved.
  t="$p/lib"; [ -d "$t" ] || t="$p"
  ls "$t"/**/*.dart >/dev/null 2>&1 || ls "$t"/*.dart >/dev/null 2>&1 || continue
  echo "### $t"
  (cd "$t" && $FLOOR/bin/cache/dart-sdk/bin/dart analyze --fatal-infos .) || true
done
```

A fix relying on syntax newer than the floor passes on `$NEW` and fails that job. Finally, run the N-1 job's
*exact* command under `$FLOOR` — it is the one thing this PR changes about that job.

If a `pana` job gates the repo, a raised SDK constraint is not penalised, but a malformed one is.

## Step 6 — Track B: raise the floor to latest − 1

Keep this out of the Track A commit — it changes what consumers can resolve and needs to be reviewable alone.

**Derive the file list by grep; do not trust a list written for another repo or another release:**

```bash
git ls-files '*pubspec.yaml' | xargs grep -ln 'sdk: \^3\.'
```

Move `melos.yaml` (source of truth), `.fvmrc` if present, the N-1 workflow's `flutter_version`, and any pubspec
melos does not reach. Then confirm propagation rather than assuming it:

```bash
melos bootstrap && git diff --stat -- '*pubspec.yaml'
git ls-files '*pubspec.yaml' | xargs grep -n 'environment' -A3   # did `flutter:` land where it should?
```

Two propagation facts that routinely surprise:

- **Melos only rewrites keys that already exist.** A pubspec with no `environment.flutter` key keeps not having
  one — correct for pure-Dart packages, and something to fix by hand where it is wrong. If *no* pubspec has one,
  the `flutter:` half of `melos.yaml` propagates nowhere; that is fine, but do not hand-add keys to make the diff
  look symmetrical.
- **The root workspace `pubspec.yaml` is often not a melos package**, so bootstrap will not touch it. Edit it by
  hand.
- Throwaway stub pubspecs sometimes pin a deliberately loose SDK. Leave them.

Set the N-1 workflow to the **new floor**, never the new stable — that job exists to prove the floor still
analyses and tests clean. Note whether the existing value is an exact release or a patch of the floor; pick one
convention and say which in the commit message.

### The floor raise activates dormant lints — budget for it

This is the step that surprises people. Raising the Dart constraint raises each package's **language version**,
and lints stay silent while their suggested fix is not expressible. Raise the floor and they fire at once, in code
nobody touched.

Concretely, Dart 3.12 legalised `this._privateField` as a named parameter, so the 3.10/3.11 → 3.12 raise activated
`prefer_initializing_formals` on 29 sites in `stream-chat-flutter`, 24 in `stream-core-flutter` and 22 in
`stream-feeds-flutter`. Treat any count as a measurement, not a prediction.

So: **`melos bootstrap` and re-analyse immediately after editing the constraints**, before writing the CHANGELOG.
Then let the tooling do the mechanical work:

```bash
for p in <every package>; do (cd $p && dart fix --dry-run); done
(cd <pkg> && dart fix --apply --code=<rule>)      # per lint, once you have decided the fix is right
```

Three things to check by hand — `dart fix` is mechanical, not thoughtful:

- **Doc comments get mangled *and silently deleted*.** It rewrites `[logger]` to `[_logger]` — leaking a private
  name into public docs, when callers still pass the *public* name (underscore stripped). It also drops any `///`
  comment attached to the parameter it rewrites. Review every comment line the refactor touched, **in both
  directions** — checking only added lines misses the deletions:

  ```bash
  git diff -- '*.dart' | grep -E "^[-+]\s*(///|//)"
  ```

  Restoring the public name can then trip `comment_references`, because `[foo]` no longer resolves once the field
  is `_foo`. Backticks satisfy both: they name the parameter callers actually pass, and resolve nothing.
- **Confirm no public parameter was renamed.** For every `this._foo` introduced, the parameter it replaced must
  have been named exactly `foo`. A mismatch is a silent breaking change for callers.
- **Re-run codegen and expect *zero* net diff.** Generators read constructor parameters, so a renamed parameter
  would silently change `.g.dart` / `.freezed.dart`.

**Always `dart format` after build_runner.** Generated files are emitted at dart_style's default 80 columns while
these repos set `page_width: 120`, so a regen dirties them with pure reflow. Format before concluding codegen
"changed" anything — and if files remain dirty afterwards, that is **generator-version drift predating your
branch**. Revert it; do not fold it into a constraint bump. (Import-alias renumbering in `injectable`-generated
config is the common example.)

### The CHANGELOG bullet

Read the repo's style guide (`STYLE_GUIDE.md` / `AGENTS.md`) and the CHANGELOG itself before writing. Common
rules: entries go under the top `## Upcoming` heading, never into an already-published version's section; if there
is no `## Upcoming`, add one rather than filing under the released version; and hand-curated changelogs must not
be regenerated with `melos version`.

Wording used across these repos:

```md
- Raised the minimum Flutter version to `>=X.Y.Z` and the Dart SDK to `^A.B.C`.
- Raised the minimum Dart SDK to `^A.B.C`.          # pure-Dart packages: Dart only
```

**Is it breaking? The repos disagree — check, do not assume.** For the identical Dart 3.12 raise:

| Package | Filed under |
|---|---|
| `stream_chat` (pure Dart) | `🔄 Changed` — not breaking |
| `stream_core` (pure Dart) | `### 💥 BREAKING CHANGES` — breaking |
| All Flutter packages in both repos | `### 🔄 Changed` — not breaking |

The Flutter-package precedent is unanimous; the pure-Dart precedent splits. Existing code keeps compiling either
way — older SDKs simply stop resolving — so default to **not breaking** (no `!` in the title), and say in the PR
body that you made the call, since a reviewer who knows only the other entry will expect the other answer.

Check what the CI changelog gate requires: a scope-to-package map may make a `chore(repo):` PR exempt from
touching a changelog at all, while a placement check still rejects entries filed outside `## Upcoming`.

### Sweep what the new floor unblocks

Still Track B, after the constraints move — it is only correct *because* the floor moved. Workarounds that exist
only until an upstream fix ships are recorded either in a `FLUTTER_BLOCKED.md` or as inline TODOs:

```bash
ls FLUTTER_BLOCKED.md 2>/dev/null
grep -rn 'TODO(flutter)' packages/ && grep -n 'TODO' analysis_options.yaml all_lint_rules.yaml
```

For each entry whose "removable at" version is now `<=` the new floor, **confirm the fix actually shipped before
deleting anything** — recorded versions are predictions, and upstream fixes slip:

```bash
git tag --contains <sha> | grep -vE '\-' | sort -V | head -1   # in a Flutter checkout
```

Then remove the workaround, its TODO, any test that only pinned the workaround's mechanism, and the row. If the
fix slipped, re-date the row instead of silently dropping it. **Re-enabling a lint is a code-style change with its
own diff** — surface it as a follow-up rather than folding it in, but do not leave a stale TODO unmentioned.

Finish with `melos bootstrap` and commit the resulting lockfile. Read the lock diff before committing: if anything
beyond the `sdks:` bound moved, this PR is "raise the floor **and** adopt newer dependencies" and the PR body must
say so.

## Step 7 — Changelog and PR

Track A changes that are user-visible (a widget swapped, a deprecation migrated) get a CHANGELOG bullet. Pure
CI/tooling/golden churn does not.

PR titles follow Conventional Commits; check whether `pr_title.yml` enforces a **required scope** and which ones
it allows.

- Track A → `chore(repo): support Flutter <version>`
- Track B → `chore(repo): bump min Flutter to <version> and Dart SDK to <version>`

For a repo whose only published package is pure Dart, name the **Dart SDK** in a Track B title — that is the
constraint consumers resolve against, and the one the diff actually changes.

Keep the skill file, if you are editing it, in **its own commit** — the same rule this skill applies to everything
else.

## Report back with attribution

Always separate the three buckets — it is the difference between a reviewable PR and a mystery:

1. **Caused by the new SDK / by the floor raise** (present on new, absent on old) — what this PR fixes.
2. **Pre-existing** (present on both) — explicitly out of scope, named so nobody re-investigates.
3. **Local-only noise** (`build/` artifacts, plugin cmake churn, platform goldens) — never appears in CI, never
   fix.

Say plainly what you could not verify. Build jobs and any package the N-1 canary does not cover are the usual
list — "the canary is green" is a much weaker claim than it sounds.
