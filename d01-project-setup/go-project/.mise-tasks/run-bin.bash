#!/usr/bin/env bash

#MISE description="🤖 Build and run the binary | alias = run-bin"
#MISE quiet=true

if ! build_output_messages=$(go build -o "bin/${BINARY_NAME}" 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

"./bin/${BINARY_NAME}"
