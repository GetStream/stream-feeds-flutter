#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Usage:
#   CHAT_DIR=/absolute/path/to/chat melos run gen:feeds
#   (or) export CHAT_DIR=... then: melos run gen:feeds
# Requires: go, dart (and optionally flutter)
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
RENAMED_MODELS="${REPO_ROOT}/scripts/renamed-models.json"  # optional

PRODUCTS="feeds,common,moderation"
API_VERSION="v2"
SPEC_DIR_REL="releases/${API_VERSION}"
SPEC_BASENAME="feeds-clientside-api"
SPEC_PATH="${SPEC_DIR_REL}/${SPEC_BASENAME}.yaml"

# ---------- helpers ----------
section() { echo ""; echo "$*"; echo ""; }

# ---------- validation ----------
[[ -d "$CHAT_DIR" ]] || { echo "❌ CHAT_DIR not found: $CHAT_DIR"; exit 1; }
command -v go   >/dev/null || { echo "❌ 'go' is required in PATH"; exit 1; }
command -v dart >/dev/null || { echo "❌ 'dart' is required in PATH"; exit 1; }
command -v perl >/dev/null || { echo "❌ 'perl' is required in PATH (post-generation fixes)"; exit 1; }

# Optional renamed-models flag
RENAMED_MODELS_FLAG=()
if [[ -f "$RENAMED_MODELS" ]]; then
  RENAMED_MODELS_FLAG=(-renamed-models "$RENAMED_MODELS")
  echo "ℹ️ Using renamed-models.json: $RENAMED_MODELS"
fi

echo ""
echo "📂 Repo:     $REPO_ROOT"
echo "📦 Package:  $PKG_DIR"
echo "🗂 Output:   $OUTPUT_DIR_FEEDS"
echo "💬 CHAT_DIR: $CHAT_DIR"
echo ""

# ---------- [1/4] Generate spec & client ----------
section "➡️ [1/4] Generating OpenAPI spec and Dart client…"

# Clean target & ensure parent exists
rm -rf "$OUTPUT_DIR_FEEDS"
mkdir -p "$OUTPUT_DIR_FEEDS"

(
  set -o pipefail
  cd "$CHAT_DIR/projects/chat-manager"

  # Generate OpenAPI spec (YAML)
  go run . openapi generate-spec \
    -products "$PRODUCTS" \
    -version "$API_VERSION" \
    --clientside \
    --encode-time-as-unix-timestamp \
    -output "$CHAT_DIR/$SPEC_DIR_REL/$SPEC_BASENAME" \
    "${RENAMED_MODELS_FLAG[@]}"

  # Generate Dart client into stream_feed generated folder
  go run . openapi generate-client \
    --language dart \
    --spec "$CHAT_DIR/$SPEC_PATH" \
    --output "$OUTPUT_DIR_FEEDS"
)

section "✅ Finished generating client at: $OUTPUT_DIR_FEEDS"

# ---------- [2/4] Post-generation fixes ----------
section "➡️ [2/4] Applying post-generation fixes…"

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

# ---------- [3/4] build_runner (package only) ----------
section "➡️ [3/4] Running build_runner in stream_feed…"

(
  cd "$PKG_DIR"
  if command -v flutter >/dev/null; then
    flutter pub run build_runner build --delete-conflicting-outputs
  else
    dart run build_runner build --delete-conflicting-outputs
  fi
)

section "✅ build_runner completed"

# ---------- [4/4] Format generated files only ----------
section "➡️ [4/4] Formatting generated API files…"

(
  cd "$PKG_DIR"
  # Format only the generated directory; keep logs, ignore exit code
  dart format "$OUTPUT_DIR_FEEDS" || true
)

section "✅ Formatting completed"

# ---------- summary ----------
section "🎉 All done!"
echo "• Spec:   $CHAT_DIR/$SPEC_PATH"
echo "• Client: $OUTPUT_DIR_FEEDS"
echo ""