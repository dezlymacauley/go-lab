#!/usr/bin/env bash

#MISE description="👷 Build the project | alias = build"
#MISE quiet=true

if ! build_output_messages=$(go build -o "bin/${BINARY_NAME}" 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

printf "\n%s\n\n" "✅ Project built: bin/${BINARY_NAME}"
