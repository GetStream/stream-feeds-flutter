#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Usage:
#   CHAT_DIR=/absolute/path/to/chat melos run gen:feeds
#   (or) export CHAT_DIR=... then: melos run gen:feeds
#
# The OpenAPI spec is *not* generated locally: it is fetched from
# https://github.com/GetStream/protocol at its latest `openapi-v*` tag.
# The chat repo is still needed for the spec -> Dart client generator.
#
# Optional env:
#   PROTOCOL_VERSION  Pin a specific tag (default: latest openapi-v* tag)
#   PROTOCOL_DIR      Use a local protocol checkout instead of cloning
#   PROTOCOL_REPO     Override the clone URL
#
# Requires: go, dart, git, perl (and optionally flutter)
# Melos sets MELOS_ROOT_PATH when invoked via `melos run`
# ============================================================

# ---------- config (env-required) ----------
: "${CHAT_DIR:?❌ CHAT_DIR not set.
Please run with:
  CHAT_DIR=/path/to/chat melos run gen:feeds
or export it in your shell/profile.}"

# ---------- paths ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${MELOS_ROOT_PATH:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

PKG_DIR="${REPO_ROOT}/packages/stream_feeds"
OUTPUT_DIR_FEEDS="${PKG_DIR}/lib/src/generated/api"
API_BARREL_FILE="${OUTPUT_DIR_FEEDS}/api.dart"
RENAMED_MODELS="${REPO_ROOT}/scripts/renamed-models.json"  # optional

PROTOCOL_REPO="${PROTOCOL_REPO:-https://github.com/GetStream/protocol.git}"
API_VERSION="v2"
SPEC_BASENAME="feeds-clientside-api"
SPEC_REPO_PATH="openapi/${API_VERSION}/${SPEC_BASENAME}.yaml"
TAG_GLOB="openapi-v*"

# ---------- helpers ----------
section() { echo ""; echo "$*"; echo ""; }

# ---------- validation ----------
[[ -d "$CHAT_DIR" ]] || { echo "❌ CHAT_DIR not found: $CHAT_DIR"; exit 1; }
command -v go   >/dev/null || { echo "❌ 'go' is required in PATH"; exit 1; }
command -v dart >/dev/null || { echo "❌ 'dart' is required in PATH"; exit 1; }
command -v git  >/dev/null || { echo "❌ 'git' is required in PATH (fetching the spec)"; exit 1; }
command -v perl >/dev/null || { echo "❌ 'perl' is required in PATH (post-generation fixes)"; exit 1; }

WORK_DIR="$(mktemp -d)"
cleanup() { rm -rf "$WORK_DIR"; }
trap cleanup EXIT

SPEC_PATH="${WORK_DIR}/${SPEC_BASENAME}.yaml"

echo ""
echo "📂 Repo:     $REPO_ROOT"
echo "📦 Package:  $PKG_DIR"
echo "🗂 Output:   $OUTPUT_DIR_FEEDS"
echo "💬 CHAT_DIR: $CHAT_DIR"
echo ""

# ---------- [1/5] Fetch the OpenAPI spec from GetStream/protocol ----------
section "➡️ [1/5] Fetching OpenAPI spec from GetStream/protocol…"

if [[ -n "${PROTOCOL_DIR:-}" ]]; then
  [[ -d "$PROTOCOL_DIR/.git" ]] || { echo "❌ PROTOCOL_DIR is not a git checkout: $PROTOCOL_DIR"; exit 1; }
  PROTOCOL_GIT_DIR="$PROTOCOL_DIR"
  echo "• Using local protocol checkout: $PROTOCOL_DIR (not fetched — make sure its tags are up to date)"
else
  PROTOCOL_GIT_DIR="${WORK_DIR}/protocol"
  # Blobless clone: full history and tags, but no file contents until asked for.
  # Keeps this to a couple of seconds instead of a full clone of the repo.
  echo "• Cloning $PROTOCOL_REPO (blobless)…"
  git clone --filter=blob:none --no-checkout --quiet "$PROTOCOL_REPO" "$PROTOCOL_GIT_DIR"
fi

# Every spec release is tagged, so the newest reachable tag is the version the
# spec on the default branch belongs to.
SPEC_VERSION="${PROTOCOL_VERSION:-$(git -C "$PROTOCOL_GIT_DIR" describe --tags --abbrev=0 --match "$TAG_GLOB")}"
[[ -n "$SPEC_VERSION" ]] || { echo "❌ Could not resolve a '$TAG_GLOB' tag in the protocol repo"; exit 1; }

echo "• Spec version: $SPEC_VERSION"

# `git show` reads straight out of the object store, so a local PROTOCOL_DIR
# keeps whatever is currently checked out there.
git -C "$PROTOCOL_GIT_DIR" show "${SPEC_VERSION}:${SPEC_REPO_PATH}" > "$SPEC_PATH" \
  || { echo "❌ Could not read ${SPEC_REPO_PATH} at ${SPEC_VERSION}"; exit 1; }

echo "• Spec: $SPEC_REPO_PATH ($(wc -c < "$SPEC_PATH" | tr -d ' ') bytes)"

# ---------- [2/5] Apply model renames to the spec ----------
section "➡️ [2/5] Applying model renames to the spec…"

# The published spec is not renamed upstream, and `generate-client` has no
# rename flag, so the renames have to be applied to the spec itself. Schema
# names live at exactly four spaces of indent (components > schemas > name).
if [[ -f "$RENAMED_MODELS" ]]; then
  while IFS=$'\t' read -r old new; do
    [[ -n "$old" && -n "$new" ]] || continue
    if ! grep -q "^    ${old}:\$" "$SPEC_PATH"; then
      echo "• Skipping ${old} -> ${new}: no such schema in the spec"
      continue
    fi
    old="$old" new="$new" perl -0777 -pi -e '
      my ($o, $n) = ($ENV{old}, $ENV{new});
      s{^(    )\Q$o\E:$}{$1$n:}mg;
      s{(\#/components/schemas/)\Q$o\E\b}{$1$n}g;
    ' "$SPEC_PATH"
    # A partially applied rename produces a spec that references a schema that
    # no longer exists, so fail here rather than deep inside the generator.
    if grep -q "\#/components/schemas/${old}\b" "$SPEC_PATH"; then
      echo "❌ Rename ${old} -> ${new} left dangling references; update scripts/generate.sh"
      exit 1
    fi
    echo "• Renamed ${old} -> ${new}"
  done < <(perl -0777 -ne 'while (/"([^"]+)"\s*:\s*"([^"]+)"/g) { print "$1\t$2\n" }' "$RENAMED_MODELS")
else
  echo "• No renamed-models.json — nothing to rename"
fi

# ---------- [3/5] Generate the Dart client ----------
section "➡️ [3/5] Generating Dart client…"

# Clean target & ensure parent exists
rm -rf "$OUTPUT_DIR_FEEDS"
mkdir -p "$OUTPUT_DIR_FEEDS"

(
  cd "$CHAT_DIR/projects/chat-manager"
  go run . openapi generate-client \
    --language dart \
    --spec "$SPEC_PATH" \
    --output "$OUTPUT_DIR_FEEDS"
)

section "✅ Finished generating client at: $OUTPUT_DIR_FEEDS"

# ---------- [4/5] Post-generation fixes ----------
section "➡️ [4/5] Applying post-generation fixes…"

# Record which spec release the checked-in client was generated from, so a diff
# in `lib/src/generated/api` can always be traced back to a protocol tag.
if [[ -f "$API_BARREL_FILE" ]]; then
  SPEC_VERSION="$SPEC_VERSION" SPEC_REPO_PATH="$SPEC_REPO_PATH" perl -0777 -pi -e '
    my $stamp = "// Source: GetStream/protocol $ENV{SPEC_REPO_PATH} @ $ENV{SPEC_VERSION}\n";
    s{^// Source: GetStream/protocol .*\n}{}m;
    s{^(.*\n)}{$1$stamp};
  ' "$API_BARREL_FILE"
  grep -q "^// Source: GetStream/protocol .* @ ${SPEC_VERSION}\$" "$API_BARREL_FILE" \
    || { echo "❌ Could not stamp the spec version into api.dart; update scripts/generate.sh"; exit 1; }
  echo "• Stamped spec version $SPEC_VERSION into api.dart"
fi

REACTION_GROUP_RESPONSE_FILE="$OUTPUT_DIR_FEEDS/model/reaction_group_response.dart"
if [[ -f "$REACTION_GROUP_RESPONSE_FILE" ]]; then
  # Upstream emits a `sumScores` field with no matching constructor parameter,
  # which does not compile. Drop the field until that is fixed upstream.
  #
  # Self-disabling: once upstream emits the parameter (or drops the field), the
  # guard below stops matching and this becomes a no-op — rather than silently
  # mangling a file that was already correct.
  if grep -q 'final int sumScores;' "$REACTION_GROUP_RESPONSE_FILE" \
    && ! grep -q 'this\.sumScores' "$REACTION_GROUP_RESPONSE_FILE"; then
    # The annotation lines between `@override` and the field vary by generator
    # version, so accept any number of them.
    perl -0777 -pi -e 's/\n[ \t]*\@override\n(?:[ \t]*\@[^\n]*\n)*[ \t]*final int sumScores;\n//' "$REACTION_GROUP_RESPONSE_FILE"
    # Never leave a half-applied edit behind: fail loudly so the next spec
    # change surfaces here instead of as a confusing build_runner error.
    if grep -q 'sumScores' "$REACTION_GROUP_RESPONSE_FILE"; then
      echo "❌ Could not strip sumScores from ReactionGroupResponse; update scripts/generate.sh"
      exit 1
    fi
    echo "• Removed unconstructable sumScores field from ReactionGroupResponse"
  fi
fi

section "✅ Post-generation fixes applied"

# ---------- [5/5] build_runner + formatting (package only) ----------
section "➡️ [5/5] Running build_runner in stream_feeds…"

(
  cd "$PKG_DIR"
  if command -v flutter >/dev/null; then
    flutter pub run build_runner build --delete-conflicting-outputs
  else
    dart run build_runner build --delete-conflicting-outputs
  fi
)

section "✅ build_runner completed"

section "➡️ Formatting generated API files…"

(
  cd "$PKG_DIR"
  # Format only the generated directory; keep logs, ignore exit code
  dart format "$OUTPUT_DIR_FEEDS" || true
)

section "✅ Formatting completed"

# ---------- summary ----------
section "🎉 All done!"
echo "• Spec:    GetStream/protocol ${SPEC_REPO_PATH} @ ${SPEC_VERSION}"
echo "• Client:  $OUTPUT_DIR_FEEDS"
echo ""
