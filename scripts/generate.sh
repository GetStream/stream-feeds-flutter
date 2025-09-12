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

PKG_DIR="${REPO_ROOT}/packages/stream_feed"
OUTPUT_DIR_FEEDS="${PKG_DIR}/lib/src/generated/api"
RENAMED_MODELS="${REPO_ROOT}/scripts/renamed-models.json"  # optional

PRODUCTS="feeds,common,moderation"
API_VERSION="v2"
SPEC_DIR_REL="releases/${API_VERSION}"
SPEC_BASENAME="feeds-clientside-api"
SPEC_PATH="${SPEC_DIR_REL}/${SPEC_BASENAME}.yaml"

# ---------- helpers ----------
section() { echo ""; echo "$*"; echo ""; }
# cross-platform sed -i (GNU vs BSD)
sed_inplace() { if sed --version >/dev/null 2>&1; then sed -i "$@"; else sed -i '' "$@"; fi; }

# ---------- validation ----------
[[ -d "$CHAT_DIR" ]] || { echo "❌ CHAT_DIR not found: $CHAT_DIR"; exit 1; }
command -v go   >/dev/null || { echo "❌ 'go' is required in PATH"; exit 1; }
command -v dart >/dev/null || { echo "❌ 'dart' is required in PATH"; exit 1; }

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
  cd "$CHAT_DIR"

  # Generate OpenAPI spec (YAML)
  go run ./cmd/chat-manager openapi generate-spec \
    -products "$PRODUCTS" \
    -version "$API_VERSION" \
    --clientside \
    --encode-time-as-unix-timestamp \
    -output "$SPEC_DIR_REL/$SPEC_BASENAME" \
    "${RENAMED_MODELS_FLAG[@]}"

  # Generate Dart client into stream_feed generated folder
  go run ./cmd/chat-manager openapi generate-client \
    --language dart \
    --spec "./$SPEC_PATH" \
    --output "$OUTPUT_DIR_FEEDS"
)

section "✅ Finished generating client at: $OUTPUT_DIR_FEEDS"

# ---------- [2/4] Post-generation fixes ----------
section "➡️ [2/4] Applying post-generation fixes…"

CALL_PARTICIPANT_FILE="$OUTPUT_DIR_FEEDS/model/call_participant.dart"
if [[ -f "$CALL_PARTICIPANT_FILE" ]]; then
  # Remove duplicate constructor arg 'role'
  sed_inplace '/required this\.role,/{N;/required this\.role,.*\n.*required this\.role,/s/\n.*required this\.role,//;}' "$CALL_PARTICIPANT_FILE"
  # Remove duplicate field/override block for 'role'
  sed_inplace '/final String role;/{N;N;N;/final String role;.*\n.*\n.*@override.*\n.*final String role;/s/\n.*\n.*@override.*\n.*final String role;//;}' "$CALL_PARTICIPANT_FILE"
  echo "• Fixed duplicate role in CallParticipant"
fi

REACTION_GROUP_RESPONSE_FILE="$OUTPUT_DIR_FEEDS/model/reaction_group_response.dart"
if [[ -f "$REACTION_GROUP_RESPONSE_FILE" ]]; then
  # Remove stray sumScores artifacts
  sed_inplace '/required this\.sumScores,/d' "$REACTION_GROUP_RESPONSE_FILE"
  sed_inplace '/@override/{N;/final int sumScores;/d;}' "$REACTION_GROUP_RESPONSE_FILE"
  echo "• Fixed extra sumScores in ReactionGroupResponse"
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