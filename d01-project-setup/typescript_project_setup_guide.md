# TypeScript Project Setup Guide
_______________________________________________________________________________

### Create the project directory and enter it

```bash
mkdir typescript-project && cd typescript-project 
```
_______________________________________________________________________________

### Use `mise` to set the version of `bun`

```bash
mise use bun@latest
```
_______________________________________________________________________________

### Initialize the project

```bash
bun init -m -y
```

Note:
- The `-m` flag is used to generate the bare `minimum` setup
- The `-y` flag is automatically answers `yes` for the rest of the prompts.

_______________________________________________________________________________

### Create the rest of the project structure

```bash
touch .gitignore bunfig.toml

mkdir .mise-tasks
cd .mise-tasks && touch clean.bash dev.bash
cd ..
chmod u+x .mise-tasks/*bash

mkdir src && touch src/index.ts
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```gitignore
# Project Dependencies
/node_modules/
```
_______________________________________________________________________________

Replace the contents of `package.json` with this
```json
{
  "scripts": {
    "clean": "rm -rf node_modules",
    "dev": "bun run src/index.ts"
  },
  "devDependencies": {
    "@types/bun": "latest"
  }
}
```
_______________________________________________________________________________

Add this to the `bunfig.toml` file
```toml
[tools]
bun = "latest"
```

Note:
- This will prevent bun from displaying the commands that a script executes,
when you run commands like `bun dev`
_______________________________________________________________________________

Replace the contents of the `tsconfig.json` with this
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
  }
}
```
_______________________________________________________________________________

Replace the contents of the `src/index.ts` file with this
```typescript
console.log("\nTypeScript Project\n");
```
_______________________________________________________________________________

### To run the project 
```bash
bun dev
```
_______________________________________________________________________________

### To delete the build output
```bash
bun clean
```
_______________________________________________________________________________
