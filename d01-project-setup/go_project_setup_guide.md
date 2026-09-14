# Go Project Setup Guide
_______________________________________________________________________________

### Create the project directory and enter it

```bash
mkdir go-project && cd go-project 
```
_______________________________________________________________________________

### Use `mise` to set the version of Go

```bash
mise use go@latest
```
_______________________________________________________________________________

### Add the this to the end of `mise.toml`

```toml
[env]
BINARY_NAME = "go-project"

[shell_alias]
build = "mise build"
clean = "mise clean"
dev = "mise dev"
run-bin = "mise run-bin"
```

The full file should look like this
```toml
[tools]
go = "latest"

[env]
BINARY_NAME = "go-project"

[shell_alias]
build = "mise build"
clean = "mise clean"
dev = "mise dev"
run-bin = "mise run-bin"
```
_______________________________________________________________________________

### Initialize the project
_______________________________________________________________________________

There are two ways of doing this:

01. Method 1 (The standard):

```
go mod init github.com/dezlymacauley/go-project
```

- The syntex is: `go mod init code_hosting_platform/user-name/project-name`
- Use this method when you are creating a project that you intend to have
as a standalone repo on a code hosting platform like `github.com`
_______________________________________________________________________________

02. Method 2 (Quick setup):

```
go mod init go-project
```

- Use this method when you are creating a project that you have 
no intention of turning into a standalone repo, 
then you can just shorten it to:

_______________________________________________________________________________

For this setup, I'll Initialize the project like this
```bash
go mod init go-project
```
_______________________________________________________________________________

### Create the rest of the project structure

```bash
touch .gitignore 
mkdir -p cmd/go-project
touch cmd/go-project/main.go

mkdir .mise-tasks
touch .mise-tasks/build.bash 
touch .mise-tasks/clean.bash
touch .mise-tasks/dev.bash 
touch .mise-tasks/run-bin.bash
chmod u+x .mise-tasks/*bash
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```gitignore
# Build Output
/bin/
```
_______________________________________________________________________________

Add this to the `cmd/go-project/main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
    fmt.Println("Go Project")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `.mise-tasks/build.bash` file
```bash
#!/usr/bin/env bash

#MISE description="👷 Build the project | alias = build"
#MISE quiet=true

if ! build_output_messages=$(
    go build \
        -o "bin/${BINARY_NAME}" \
        "./cmd/${BINARY_NAME}" \
        2>&1
); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

printf "\n%s\n\n" "✅ Project built: bin/${BINARY_NAME}"
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🧼 Delete build output and cache | alias = clean"
#MISE quiet=true

if [ ! -d bin ]; then
    printf "\n%s\n\n" '✅ No bin directory found'
    exit 0
fi

rm -rf bin
printf "\n%s\n\n" '✅ The bin directory has been deleted'

go clean -cache
printf "\n%s\n\n" '✅ Build cache has been deleted'
```
_______________________________________________________________________________

Add this to the `.mise-tasks/dev.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🚀 Run the project | alias = dev"
#MISE quiet=true

go run "./cmd/${BINARY_NAME}"
```
_______________________________________________________________________________

Add this to the `.mise-tasks/run-bin.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🤖 Build and run the binary | alias = run-bin"
#MISE quiet=true

if ! build_output_messages=$(
    go build \
        -o "bin/${BINARY_NAME}" \
        "./cmd/${BINARY_NAME}" \
        2>&1
); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_messages"
    exit 1
fi

"./bin/${BINARY_NAME}"
```
_______________________________________________________________________________

### To view a list of mise tasks

```bash
mise tasks
```

You should see an output like this:
```
Name     Description
build    👷 Build the project | alias = build
clean    🧼 Delete the 'bin' directory | alias = clean
dev      🚀 Run the project | alias = dev
run-bin  🤖 Build and run the binary | alias = run-bin
```
_______________________________________________________________________________
