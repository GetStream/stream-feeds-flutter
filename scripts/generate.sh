#!/usr/bin/env bash
set -euo pipefail

# =========================
# CONFIG — each dev sets this ONCE
# =========================
CHAT_DIR="/ABSOLUTE/PATH/TO/YOUR/chat/repo"
if [[ "$CHAT_DIR" == "/ABSOLUTE/PATH/TO/YOUR/chat/repo" ]]; then
  echo "❌ Please edit scripts/gen-feeds.sh and set CHAT_DIR to your local chat repo path"
  exit 1
fi

# =========================
# Paths
# =========================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${MELOS_ROOT_PATH:-$(cd "${SCRIPT_DIR}/.." && pwd)}"

PKG_DIR="${REPO_ROOT}/packages/stream_feeds"
OUTPUT_DIR_FEEDS="${PKG_DIR}/lib/src/generated/api"
RENAMED_MODELS="${REPO_ROOT}/scripts/renamed-models.json"

PRODUCTS="feeds,common,moderation"
API_VERSION="v2"

# =========================
# Helpers
# =========================
sed_inplace() { if sed --version >/dev/null 2>&1; then sed -i "$@"; else sed -i '' "$@"; fi; }

# =========================
# Validation
# =========================
[[ -d "$CHAT_DIR" ]] || { echo "❌ CHAT_DIR not found: $CHAT_DIR"; exit 1; }
[[ -f "$RENAMED_MODELS" ]] || { echo "❌ renamed-models.json not found: $RENAMED_MODELS"; exit 1; }
command -v go >/dev/null || { echo "❌ 'go' is required in PATH"; exit 1; }
command -v dart >/dev/null || { echo "❌ 'dart' is required in PATH"; exit 1; }

echo ""
echo "📂 Repo:     $REPO_ROOT"
echo "📦 Package:  $PKG_DIR"
echo "💬 CHAT_DIR: $CHAT_DIR"
echo ""

# =========================
# Generate spec & client
# =========================
echo "➡️ [1/4] Generating OpenAPI spec and Dart client..."
rm -rf "$OUTPUT_DIR_FEEDS"
mkdir -p "$OUTPUT_DIR_FEEDS"

(
  set -o pipefail
  cd "$CHAT_DIR"

  go run ./cmd/chat-manager openapi generate-spec \
    -products "$PRODUCTS" \
    -version "$API_VERSION" \
    --clientside \
    --encode-time-as-unix-timestamp \
    -output "releases/${API_VERSION}/feeds-clientside-api" \
    -renamed-models "$RENAMED_MODELS"

  go run ./cmd/chat-manager openapi generate-client \
    --language dart \
    --spec "./releases/${API_VERSION}/feeds-clientside-api.yaml" \
    --output "$OUTPUT_DIR_FEEDS"
)
echo "✅ Finished generating client"
echo ""

# =========================
# Post-gen fixes
# =========================
echo "➡️ [2/4] Applying post-generation fixes..."
CALL_PARTICIPANT_FILE="$OUTPUT_DIR_FEEDS/model/call_participant.dart"
if [[ -f "$CALL_PARTICIPANT_FILE" ]]; then
  sed_inplace '/required this\.role,/{N;/required this\.role,.*\n.*required this\.role,/s/\n.*required this\.role,//;}' "$CALL_PARTICIPANT_FILE"
  sed_inplace '/final String role;/{N;N;N;/final String role;.*\n.*\n.*@override.*\n.*final String role;/s/\n.*\n.*@override.*\n.*final String role;//;}' "$CALL_PARTICIPANT_FILE"
  echo "• Fixed duplicate role in CallParticipant"
fi

REACTION_GROUP_RESPONSE_FILE="$OUTPUT_DIR_FEEDS/model/reaction_group_response.dart"
if [[ -f "$REACTION_GROUP_RESPONSE_FILE" ]]; then
  sed_inplace '/required this\.sumScores,/d' "$REACTION_GROUP_RESPONSE_FILE"
  sed_inplace '/@override/{N;/final int sumScores;/d;}' "$REACTION_GROUP_RESPONSE_FILE"
  echo "• Fixed extra sumScores in ReactionGroupResponse"
fi
echo "✅ Post-generation fixes applied"
echo ""

# =========================
# build_runner (package only)
# =========================
echo "➡️ [3/4] Running build_runner in stream_feeds..."
(
  cd "$PKG_DIR"
  if command -v flutter >/dev/null; then
    flutter pub run build_runner build --delete-conflicting-outputs
  else
    dart run build_runner build --delete-conflicting-outputs
  fi
)
echo "✅ build_runner completed"
echo ""

# =========================
# Format (package only)
# =========================
echo "➡️ [4/4] Formatting stream_feeds package..."
(
  cd "$PKG_DIR"
  dart format "$OUTPUT_DIR_FEEDS" >/dev/null 2>&1 || true
)
echo "✅ Formatting completed"
echo ""

echo "🎉 All done! Generated + codegen + formatted: $PKG_DIR"