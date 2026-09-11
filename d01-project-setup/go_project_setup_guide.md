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

### Add this to the end of `mise.toml`

```toml
[env]
BINARY_NAME = "go-project"
```
_______________________________________________________________________________

### Initialize the project
_______________________________________________________________________________

There are two ways of doing this:

01. Method 1 (The standard):

- Use this method when you are creating a project that you intend to have
as a standalone repo on a code hosting platform like `github.com`

- `go mod init code_hosting_platform/user-name/project-name`
- E.g. `go mod init github.com/dezlymacauley/go-project`

_______________________________________________________________________________

02. Method 2 (Quick setup):

- Use this method when you are creating a project that you have 
no intention of turning into a standalone repo, 
then you can just shorten it to:

`go mod init project-name`

_______________________________________________________________________________

For this setup, I'll Initialize the project like this
```bash
go mod init go-project
```
_______________________________________________________________________________

### Create the rest of the project structure

```bash
touch .gitignore main.go

mkdir .mise-tasks
cd .mise-tasks && touch build.bash clean.bash dev.bash runbin.bash
cd ..
chmod u+x .mise-tasks/*bash
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```gitignore
# Build Output
/bin/
```
_______________________________________________________________________________

Add this to the `main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println("\nGo Project\n")
}
```
_______________________________________________________________________________




_______________________________________________________________________________

### To view a list of `mise tasks`

Run this command
```bash
mise tasks
```

You should see an output like this
```
Name    Description
build   👷 Build the project
clean   🧼 Delete the 'bin' directory
dev     🚀 Run the project
runbin  🤖 Run the binary in the 'bin' directory
```
_______________________________________________________________________________

Add this to the `.mise-tasks/build.bash` file
```bash
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
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🧼 Delete the 'bin' directory"
#MISE quiet=true

if [ ! -d bin ]; then
    printf "\n%s\n\n" '✅ No bin directory found'
    exit 0
fi

rm -rf bin
printf "\n%s\n\n" '✅ The bin directory has been deleted'
```
_______________________________________________________________________________

Add this to the `.mise-tasks/dev.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🚀 Run the project"
#MISE quiet=true

go run .
```
_______________________________________________________________________________

Add this to the `.mise-tasks/runbin.bash` file
```bash
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
```
_______________________________________________________________________________

### To run the program without creating an executable binary
```bash
mise dev
```
_______________________________________________________________________________

### Build the program (Create an executable binary)

```bash
mise build
```
_______________________________________________________________________________

### Run the binary executable

```bash
mise runbin
```
_______________________________________________________________________________

### To delete the build output
```bash
mise clean
```
_______________________________________________________________________________
