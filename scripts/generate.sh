#!/usr/bin/env bash

CHAT_DIR=/Users/xsahil03x/WebstormProjects/chat
OUTPUT_DIR_FEEDS=/Users/xsahil03x/StudioProjects/stream-feeds-flutter/packages/stream_feeds/lib/src/generated/api/

if [ ! -d $CHAT_DIR ]
then
  echo "cannot find chat path on the parent folder (${CHAT_DIR}), do you have a copy of the API source?";
  exit 1;
fi

set -ex

# remove old generated code
rm -rf /Users/xsahil03x/StudioProjects/stream-feeds-flutter/packages/stream_feeds/lib/src/generated/api/model/*

# cd in API repo, generate new spec and then generate code from it
(
  cd $CHAT_DIR &&
  go run ./cmd/chat-manager openapi generate-spec -products feeds,common,moderation -version v2 -clientside -encode-time-as-unix-timestamp -output releases/v2/feeds-clientside-api -renamed-models /Users/xsahil03x/StudioProjects/stream-feeds-flutter/scripts/renamed-models.json &&
  go run ./cmd/chat-manager openapi generate-client --language dart --spec ./releases/v2/feeds-clientside-api.yaml --output $OUTPUT_DIR_FEEDS
)

# Fix duplicate role field in CallParticipant model (OpenAPI template bug)
CALL_PARTICIPANT_FILE="$OUTPUT_DIR_FEEDS/model/call_participant.dart"
if [ -f "$CALL_PARTICIPANT_FILE" ]; then
  sed -i '' '/required this\.role,/{N; /required this\.role,.*\n.*required this\.role,/s/\n.*required this\.role,//;}' "$CALL_PARTICIPANT_FILE"
  sed -i '' '/final String role;/{N;N;N; /final String role;.*\n.*\n.*@override.*\n.*final String role;/s/\n.*\n.*@override.*\n.*final String role;//;}' "$CALL_PARTICIPANT_FILE"
  echo "Fixed duplicate role field in CallParticipant model using sed"
fi

melos generate:all
melos format
