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
go mod init project-name
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
touch .gitignore main.go

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

Add this to the `main.go` file
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

Add this to the `.mise-tasks/run-bin.bash` file
```bash
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
```
_______________________________________________________________________________

### Add the shell aliases to the end of `mise.toml`

```toml
[tools]
go = "latest"

[shell_alias]
build = "mise build"
clean = "mise clean"
dev = "mise dev"
run-bin = "mise run-bin"
```
_______________________________________________________________________________

### To view a list of mise tasks

```bash
mise tasks
```

You should see an output like this:
```
Name     Description
build    👷 Build the project
clean    🧼 Delete the 'bin' directory
dev      🚀 Run the project
run-bin  🤖 Run the binary in the 'bin' directory
```
_______________________________________________________________________________
