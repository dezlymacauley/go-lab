#!/usr/bin/env bash

#MISE description="🧼 Clean the Go build cache"
#MISE quiet=true

go clean -cache

printf "\n%s\n\n" '✅ The Go build cache has been cleaned'
