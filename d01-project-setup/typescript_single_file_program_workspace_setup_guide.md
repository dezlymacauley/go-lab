# TypeScript Single-File Program Workspace Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir typescript-single-file-program-workspace
cd typescript-single-file-program-workspace
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version of `bun`
```bash
mise use bun@latest
```

Note:
- `bun` can run TypeScript files directly
_______________________________________________________________________________

Intialize the project structure
```bash
bun init -m -y
```

Note:
- The `-m` flag is used to generate the bare minimum setup
- The `-y` flag automatically answers yes for the rest of the prompts
_______________________________________________________________________________


### Create the project structure

```bash
touch .gitignore

mkdir programs

mkdir programs/d01-topic-one
touch programs/d01-topic-one/f01_alpha.ts
touch programs/d01-topic-one/f02_bravo.ts

mkdir programs/d02-topic-two
touch programs/d02-topic-two/f01_charlie.ts
touch programs/d02-topic-two/f02_delta.ts

mkdir .mise-tasks 
touch .mise-tasks/clean.bash 
chmod u+x .mise-tasks/*.bash
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file

```bash
#!/usr/bin/env bash

#MISE description="🧼 Delete the 'node_modules' directory"
#MISE quiet=true

if [ ! -d node_modules ]; then
    printf "\n%s\n\n" '✅ No node_modules directory found'
    exit 0
fi

rm -rf node_modules
printf "\n%s\n\n" '✅ The node_modules directory has been deleted'
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```gitignore
# External Dependencies
/node_modules/
```

Note:
- Even if you have no external depencies in the project, 
`bun` will still create this directory because most TypeScript projects 
will eventually have one.
_______________________________________________________________________________

Replace the contents of `tsconfig.json` with this
```json
{
  "compilerOptions": {
    // Environment setup & latest features
    "lib": ["ESNext", "DOM"],
    "target": "ESNext",
    "module": "Preserve",
    "moduleDetection": "force",
    "jsx": "react-jsx",
    "allowJs": true,
    "types": ["bun"],

    // Bundler mode
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "verbatimModuleSyntax": true,
    "noEmit": true,

    // Best practices
    "strict": true,
    "skipLibCheck": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,

    // Some stricter flags (disabled by default)
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noPropertyAccessFromIndexSignature": true
  },
  "include": ["programs/**/*"]
}
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f01_alpha.ts` file
```typescript
console.log("\nThis is f01_alpha.ts\n");
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f02_bravo.ts` file
```typescript
console.log("\nThis is f02_bravo.ts\n");
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f01_charlie.ts` file
```typescript
console.log("\nThis is f01_charlie.ts\n");
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f02_delta.ts` file
```typescript
console.log("\nThis is f02_delta.ts\n");
```
_______________________________________________________________________________

### To view a list of `mise tasks`, run this command
```bash
mise tasks
```

You should get an output like this
```
Name   Description
clean  🧼 Delete the 'node_modules' directory
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
