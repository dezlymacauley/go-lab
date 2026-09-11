#!/usr/bin/env bash

#MISE description="👷 Build the project"
#MISE quiet=true

# Check if there were any error messages in the build output
if ! build_output_messages=$(go build -o bin/go-project 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

printf "\n%s\n\n" '✅ Project built'
