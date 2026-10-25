# Go Project Setup Guide
_______________________________________________________________________________

Create the project directory
```bash
mkdir go-project
```
_______________________________________________________________________________

Enter the project directory
```bash
cd go-project
```
_______________________________________________________________________________

Set the project to use the latest version of `go` (Go compiler)
```bash
mise use go@latest
```

#### Note:
- If you want to use a specific version you can use mise to check

- To get the version number of the latest available Go 
that you can use in a project, run this command: `mise latest go`

- If you want to view a list of valid Go versions that you can use,
run this command: `mise ls-remote go`
_______________________________________________________________________________

Set the project to use the latest version of `eza` (project structure viewer)
```bash
mise use eza@latest
```
_______________________________________________________________________________

Update the `mise.toml` file in the project to look like this
```toml
[env]
BINARY_NAME = "go-project"
#______________________________________________________________________________

[tools]
eza = "latest"
go = "latest"
#______________________________________________________________________________

[tasks.build]
description = "👷 Build the project | alias = build"
quiet = true
run = """

go build -o "bin/${BINARY_NAME}" "./cmd/${BINARY_NAME}"

"""

#______________________________________________________________________________

[tasks.clean]
description = "🧼 Delete build output and cache | alias = clean"
quiet = true
run = """

rm -rf bin
go clean -cache
"""
#______________________________________________________________________________

[tasks.format]
description = "📜 Run the code formatter on the project | alias = format"
quiet = true
run = """

gofmt -w .

"""
#______________________________________________________________________________

[tasks.run-bin]
description = "🤖 Build and run the binary | alias = run-bin"
depends = ["build"]
quiet = true
run = """

"./bin/${BINARY_NAME}"

"""
#______________________________________________________________________________

[tasks.setup]
description = "🚀 Setup the project | alias = setup"
quiet = true
run = """

go mod tidy

"""
#______________________________________________________________________________

[tasks.structure]
description = "🌲 View the project structure | alias = structure"
quiet = true
run = """

eza --tree --git-ignore

"""
#______________________________________________________________________________

[shell_alias]
build = "mise run build"
clean = "mise run clean"
format = "mise run format"
run = "go run ./cmd/go-project"
run-bin = "mise run run-bin"
setup = "mise run setup"
structure = "mise run structure"
#______________________________________________________________________________
```
_______________________________________________________________________________

Create a `.gitignore` file
```sh
touch .gitignore
```
_______________________________________________________________________________

Add this to the `.gitignore` file

```gitignore
# Build Output
bin/
```
_______________________________________________________________________________

Intialize the project
```bash
go mod init go-project
```

#### Note:
- If you are creating a standalone repo on Github 
then you should run this command:

`go mod init github.com/your-github-username/go-project`
_______________________________________________________________________________

To confirm that your project is using the correct version of Go, 
run this:
```sh
go version
which go
```

You should see an output similar to this:
```
go version go1.27.3 linux/amd64
/home/dezlymacauley/.local/share/mise/installs/go/1.27.3/bin/go
```
_______________________________________________________________________________

Create the project structure
```bash
mkdir -p cmd/go-project
touch cmd/go-project/main.go
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

Run this command to see the list of `mise tasks` in your project
```bash
mise tasks
```

You should see an output like this
```
Name       Description
build      👷 Build the project | alias = build
clean      🧼 Delete build output and cache | alias = clean
format     📜 Run the code formatter on the project | alias = format
run-bin    🤖 Build and run the binary | alias = run-bin
setup      🚀 Setup the project | alias = setup
structure  🌲 View the project structure | alias = structure
```
_______________________________________________________________________________

To view the project structure
```bash
structure
```

This should be the structure
```
.
├── cmd
│   └── go-project
│       └── main.go
├── go.mod
└── mise.toml
```
_______________________________________________________________________________

To run the project, all you need is one command:
```bash
run
```
_______________________________________________________________________________
