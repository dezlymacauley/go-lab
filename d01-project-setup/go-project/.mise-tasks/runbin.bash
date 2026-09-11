#!/usr/bin/env bash

#MISE description="🤖 Run the binary in the 'bin' directory"
#MISE quiet=true

if [[ ! -f "./bin/${BINARY_NAME}" ]]; then
    printf "\n%s\n\n" '❌ There is no binary to run'
    printf "%s\n" 'Run this command first:'
    printf "\n%s\n\n" 'mise build'
    exit 1
fi

"./bin/${BINARY_NAME}"
