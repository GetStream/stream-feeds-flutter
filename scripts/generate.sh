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

# The API version the spec was generated from.
spec_version() {
  awk '/^info:/ { in_info = 1; next }
       in_info && /^  version:/ { print $2; exit }
       in_info && /^[^ ]/ { exit }' "$1"
}

# A stable identifier for a checkout: its nearest tag when it has one, else a
# short sha, suffixed with -dirty when the tree carries uncommitted changes.
git_stamp() {
  local dir="$1" rev
  git -C "$dir" rev-parse --git-dir >/dev/null 2>&1 || { echo "unknown"; return; }
  rev="$(git -C "$dir" describe --tags --always 2>/dev/null)"
  [[ -n "$rev" ]] || rev="$(git -C "$dir" rev-parse --short=9 HEAD)"
  [[ -n "$(git -C "$dir" status --porcelain 2>/dev/null)" ]] && rev="${rev}-dirty"
  echo "$rev"
}

# ---------- validation ----------
[[ -d "$CHAT_DIR" ]] || { echo "❌ CHAT_DIR not found: $CHAT_DIR"; exit 1; }
command -v go   >/dev/null || { echo "❌ 'go' is required in PATH"; exit 1; }
command -v dart >/dev/null || { echo "❌ 'dart' is required in PATH"; exit 1; }
command -v git  >/dev/null || { echo "❌ 'git' is required in PATH (fetching the spec)"; exit 1; }
command -v perl >/dev/null || { echo "❌ 'perl' is required in PATH (post-generation fixes)"; exit 1; }
# Required up front rather than skipped later: without a hasher the spec cannot
# be checked against the sha256 protocol publishes beside it, and a run that
# silently skips that check is worse than one that refuses to start.
command -v shasum >/dev/null || command -v sha256sum >/dev/null \
  || { echo "❌ 'shasum' or 'sha256sum' is required in PATH (verifying the spec)"; exit 1; }

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
if [[ -n "${PROTOCOL_VERSION:-}" ]]; then
  SPEC_VERSION="$PROTOCOL_VERSION"
else
  # Kept off the assignment line: under `set -e` a failing command
  # substitution there aborts the script before any check of the result runs.
  SPEC_VERSION="$(git -C "$PROTOCOL_GIT_DIR" describe --tags --abbrev=0 --match "$TAG_GLOB" 2>/dev/null)" \
    || { echo "❌ Could not resolve a '$TAG_GLOB' tag in the protocol repo"; exit 1; }
  [[ -n "$SPEC_VERSION" ]] \
    || { echo "❌ Resolved an empty '$TAG_GLOB' tag in the protocol repo"; exit 1; }
fi

echo "• Spec version: $SPEC_VERSION"

# `git show` reads straight out of the object store, so a local PROTOCOL_DIR
# keeps whatever is currently checked out there.
git -C "$PROTOCOL_GIT_DIR" show "${SPEC_VERSION}:${SPEC_REPO_PATH}" > "$SPEC_PATH" \
  || { echo "❌ Could not read ${SPEC_REPO_PATH} at ${SPEC_VERSION}"; exit 1; }

echo "• Spec: $SPEC_REPO_PATH ($(wc -c < "$SPEC_PATH" | tr -d ' ') bytes)"

# Protocol publishes a sha256 beside each spec. Check the fetched bytes against
# it before anything touches them: verifying rather than trusting, so an edited
# or truncated spec can't reach the generator and then be stamped with a
# checksum that describes different bytes.
#
# Read now, while $SPEC_PATH is still pristine — [2/5] rewrites it in place, so
# the stamped checksum identifies the spec as protocol published it, not our
# renamed copy.
SPEC_CHECKSUM=""
if SIDECAR="$(git -C "$PROTOCOL_GIT_DIR" show "${SPEC_VERSION}:${SPEC_REPO_PATH}.sha256" 2>/dev/null)"; then
  SPEC_CHECKSUM="$(awk '{ print $1; exit }' <<< "$SIDECAR")"
  if command -v shasum >/dev/null; then
    SPEC_ACTUAL="$(shasum -a 256 "$SPEC_PATH" | awk '{ print $1 }')"
  else
    SPEC_ACTUAL="$(sha256sum "$SPEC_PATH" | awk '{ print $1 }')"
  fi
  [[ "$SPEC_ACTUAL" == "$SPEC_CHECKSUM" ]] || {
    echo "❌ Spec checksum mismatch for $SPEC_REPO_PATH"
    echo "   expected $SPEC_CHECKSUM (from the .sha256 sidecar)"
    echo "   actual   $SPEC_ACTUAL"
    exit 1
  }
  echo "• Checksum verified against the published .sha256"
else
  echo "• No .sha256 sidecar at $SPEC_VERSION — nothing to verify against"
fi

# What the provenance stamp records, resolved here while the inputs are in hand.
SPEC_API_VERSION="$(spec_version "$SPEC_PATH")"
[[ -n "$SPEC_API_VERSION" ]] || SPEC_API_VERSION="unknown"
SPEC_SOURCE_STAMP="protocol @ ${SPEC_VERSION}"

# ---------- [2/5] Apply model renames to the spec ----------
section "➡️ [2/5] Applying model renames to the spec…"

# The published spec is not renamed upstream, and `generate-client` has no
# rename flag, so the renames have to be applied to the spec itself. Schema
# names live at exactly four spaces of indent (components > schemas > name).
if [[ -f "$RENAMED_MODELS" ]]; then
  # Parsed as JSON rather than scanned for string pairs, so nesting or a
  # non-string value is an error instead of silently becoming another rename.
  #
  # Read into a variable first: a `die` inside a process substitution does not
  # fail the script under `set -e`, so the loop would read nothing and the run
  # would go on to report success against an unrenamed spec.
  RENAMES="$(perl -MJSON::PP -0777 -ne '
    my $m = decode_json($_);
    ref $m eq "HASH" or die "renamed-models.json: top level is not an object\n";
    for my $k (sort keys %$m) {
      die "renamed-models.json: value for \"$k\" is not a string\n" if ref $m->{$k};
      print "$k\t$m->{$k}\n";
    }
  ' "$RENAMED_MODELS")" \
    || { echo "❌ Could not read $RENAMED_MODELS (see the error above)"; exit 1; }

  while IFS=$'\t' read -r old new; do
    [[ -n "$old" && -n "$new" ]] || continue
    if ! grep -q "^    ${old}:\$" "$SPEC_PATH"; then
      echo "• Skipping ${old} -> ${new}: no such schema in the spec"
      continue
    fi
    # Renaming onto a name the spec already uses would leave two identical
    # schema keys and let the YAML parser pick whichever it resolves last, so
    # refuse rather than generate against a silently wrong spec.
    if grep -q "^    ${new}:\$" "$SPEC_PATH"; then
      echo "❌ Rename ${old} -> ${new} collides with an existing ${new} schema; update scripts/renamed-models.json"
      exit 1
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
  done <<< "$RENAMES"
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

# ---------- [4/5] Stamp provenance ----------
section "➡️ [4/5] Stamping provenance into api.dart…"

# `generate-client` was just pointed at $OUTPUT_DIR_FEEDS, so a missing barrel
# means generation produced nothing — fail rather than carry on and still
# report success at the end.
[[ -f "$API_BARREL_FILE" ]] \
  || { echo "❌ Generation produced no api.dart at $API_BARREL_FILE"; exit 1; }

# Record what produced this tree, in the barrel a reader opens first. Same block
# and same field widths as the chat SDK writes, so the two clients read alike.
#
# The generator stamps no version of its own, so the closest thing to a template
# version is the commit of the monolith that holds the templates. The spec
# carries two of its own: `info.version` is the backend build it was cut from,
# and protocol publishes a sha256 beside each spec that identifies the exact
# bytes even when a checkout sits between tags.
#
# Deliberately free of timestamps — regenerating from unchanged inputs must
# produce no diff.
stamp_provenance() {
  local marker='// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.'

  grep -qF -- "$marker" "$API_BARREL_FILE" || {
    echo "❌ Generator header not found in $API_BARREL_FILE — has the template changed?"
    exit 1
  }

  local checksum_line=""
  [[ -n "$SPEC_CHECKSUM" ]] && checksum_line="// Checksum:  ${SPEC_CHECKSUM}"

  awk -v marker="$marker" \
      -v spec="// Spec:      ${SPEC_BASENAME} (API ${SPEC_API_VERSION})" \
      -v source="// Source:    ${SPEC_SOURCE_STAMP}" \
      -v checksum="$checksum_line" \
      -v generator="// Generator: GetStream/chat @ $(git_stamp "$CHAT_DIR")" '
    { print }
    $0 == marker {
      print "//"
      print spec
      print source
      if (checksum != "") print checksum
      print generator
    }
  ' "$API_BARREL_FILE" > "${API_BARREL_FILE}.tmp" && mv "${API_BARREL_FILE}.tmp" "$API_BARREL_FILE"

  echo "• Stamped ${SPEC_BASENAME} (API ${SPEC_API_VERSION}) from ${SPEC_SOURCE_STAMP}"
}
stamp_provenance

section "✅ Provenance stamped"

# ---------- [5/5] build_runner + formatting ----------
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

section "➡️ Formatting…"

# build_runner formats every output it writes — including pre-existing ones
# outside the generated directory — at the dart_style default width, so a pass
# at the width this repo configures is needed afterwards. Formatting only
# $OUTPUT_DIR_FEEDS leaves the `.freezed.dart` files under lib/src/models
# rewrapped at 80, which shows up as phantom diff.
#
# Delegated to `melos run format` rather than calling `dart format` here, so
# there is one definition of how this repo formats and this script cannot drift
# from it. A failure propagates: an unformatted tree would otherwise reach the
# repo's formatting check with this run already reporting success.
(
  cd "$REPO_ROOT"
  melos run format
)

# The stamp goes in before build_runner and the format pass rewrite the tree; a
# formatter that dropped it would leave a run looking successful but
# unprovenanced.
grep -q 'Generator: GetStream/chat @' "$API_BARREL_FILE" || {
  echo "❌ The provenance stamp did not survive formatting — see stamp_provenance"
  exit 1
}

section "✅ Formatting completed"

# ---------- summary ----------
section "🎉 All done!"
echo "• Spec:    GetStream/protocol ${SPEC_REPO_PATH} @ ${SPEC_VERSION}"
echo "• Client:  $OUTPUT_DIR_FEEDS"
echo ""
