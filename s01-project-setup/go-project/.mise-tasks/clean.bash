#!/usr/bin/env bash

#MISE description="🧼 Delete the 'bin' directory"
#MISE quiet=true

if [ ! -d bin ]; then
    printf "\n%s\n\n" '✅ No bin directory found'
    exit 0
fi

rm -rf bin
printf "\n%s\n\n" '✅ The bin directory has been deleted'
