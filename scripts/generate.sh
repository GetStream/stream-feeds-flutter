#!/usr/bin/env bash

SOURCE_PATH=../chat

if [ ! -d $SOURCE_PATH ]
then
  echo "cannot find chat path on the parent folder (${SOURCE_PATH}), do you have a copy of the API source?";
  exit 1;
fi

set -ex

# remove old generated code
rm -rf ./packages/stream_feeds/lib/generated/api/model/*

# cd in API repo, generate new spec and then generate code from it
(
  cd $SOURCE_PATH &&
  go run ./cmd/chat-manager openapi generate-spec -products feeds -version v1 -clientside -output releases/feeds-openapi-clientside -renamed-models ../stream-feeds-flutter/scripts/renamed-models.json &&
  go run ./cmd/chat-manager openapi generate-client --language dart --spec ./releases/feeds-openapi-clientside.yaml --output ../stream-feeds-flutter/packages/stream_feeds/lib/generated/api/
)

melos format
