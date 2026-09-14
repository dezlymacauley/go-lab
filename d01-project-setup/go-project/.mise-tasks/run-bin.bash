#!/usr/bin/env bash

#MISE description="🤖 Run the binary in the 'bin' directory"
#MISE quiet=true

# Check if there were any error messages in the build output
if ! build_output_messages=$(go build -o bin/go-project 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

"./bin/go-project"
