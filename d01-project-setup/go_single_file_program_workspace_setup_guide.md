# Go Single-File Program Workspace Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir go-single-file-program-workspace
cd go-single-file-program-workspace
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version of `go`
```bash
mise use go@latest
```
_______________________________________________________________________________

Intialize the project structure
```bash
go mod init go-single-file-program-workspace
```
_______________________________________________________________________________


### Create the project structure

```bash
mkdir programs

mkdir programs/d01-topic-one
touch programs/d01-topic-one/f01_alpha.go
touch programs/d01-topic-one/f02_bravo.go

mkdir programs/d02-topic-two
touch programs/d02-topic-two/f01_charlie.go
touch programs/d02-topic-two/f02_delta.go

mkdir .mise-tasks
touch .mise-tasks/clean.bash
chmod u+x .mise-tasks/*.bash
```

New structure
```bash
mkdir programs

mkdir programs/d01-topic-one
touch programs/d01-topic-one/f01_alpha.go
touch programs/d01-topic-one/f02_bravo.go

mkdir programs/d02-topic-two
touch programs/d02-topic-two/f01_charlie.go
touch programs/d02-topic-two/f02_delta.go

mkdir .mise-tasks
touch .mise-tasks/clean.bash
chmod u+x .mise-tasks/*.bash
```
_______________________________________________________________________________

Add this to the end of the `mise.toml` file
```toml
[shell_alias]
clean = "mise clean"
```

The full file should look like this now
```bash
[tools]
go = "latest"

[shell_alias]
clean = "mise clean"
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file

```bash
#!/usr/bin/env bash

#MISE description="🧼 Clean the Go build cache"
#MISE quiet=true

go clean -cache

printf "\n%s\n\n" '✅ The Go build cache has been cleaned'
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f01_alpha.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f01_alpha.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f02_bravo.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f02_bravo.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f01_charlie.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f01_charlie.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f02_delta.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f02_delta.go")
    fmt.Println()
}
```
_______________________________________________________________________________

### To run a program

E.g. To run `f01_alpha`

Go to the directory where the file is located
```bash
cd programs/d01-topic-one
```

Run the program with `bun`
```bash
bun f01_alpha.ts
```
_______________________________________________________________________________
