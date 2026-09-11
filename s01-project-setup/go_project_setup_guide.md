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

### To run the program without creating an executable binary
```bash
go run .
```
_______________________________________________________________________________

### Build the program (Create an executable binary)

```bash
go build -o bin/go-project
```
_______________________________________________________________________________

### Run the binary executable

```bash
./bin/go-project
```
_______________________________________________________________________________

### To delete the build output
```bash
rm -rf bin
```
_______________________________________________________________________________
