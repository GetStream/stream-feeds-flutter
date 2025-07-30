#!/usr/bin/env bash

CHAT_DIR=../chat
OUTPUT_DIR_FEEDS=../stream-feeds-flutter/packages/stream_feeds/lib/src/generated/api/

if [ ! -d $CHAT_DIR ]
then
  echo "cannot find chat path on the parent folder (${CHAT_DIR}), do you have a copy of the API source?";
  exit 1;
fi

set -ex

# remove old generated code
rm -rf ./packages/stream_feeds/lib/generated/api/model/*

# cd in API repo, generate new spec and then generate code from it
( cd $CHAT_DIR ; make openapi ; go run ./cmd/chat-manager openapi generate-client --language dart --spec ./releases/v2/feeds-clientside-api.yaml --output $OUTPUT_DIR_FEEDS )

melos format
