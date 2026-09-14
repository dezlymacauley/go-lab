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

mkdir -p programs/d01-topic-one/f01-alpha
touch programs/d01-topic-one/f01-alpha/main.go

mkdir -p programs/d01-topic-one/f02-bravo
touch programs/d01-topic-one/f02-bravo/main.go

mkdir -p programs/d02-topic-two/f01-charlie
touch programs/d02-topic-two/f01-charlie/main.go

mkdir -p programs/d02-topic-two/f02-delta
touch programs/d02-topic-two/f02-delta/main.go

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

Add this to the `programs/d01-topic-one/f01-alpha/main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f01-alpha.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f02-bravo/main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f02-bravo.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f01-charlie/main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f01-charlie.go")
    fmt.Println()
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f02-delta/main.go` file
```go
package main

import "fmt"

func main() {
    fmt.Println()
	fmt.Println("This is f02-delta.go")
    fmt.Println()
}
```
_______________________________________________________________________________

### To run a program

E.g. To run `programs/d01-topic-one/f01-alpha/main.go`

Go to the directory where the file is located
```bash
cd programs/d01-topic-one/f01-alpha
```

Run the program with `go`
```bash
go run .
```
_______________________________________________________________________________
