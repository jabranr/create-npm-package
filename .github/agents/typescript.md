# TypeScript Configuration

## TypeScript Version

- **Version**: ^5.8.3
- Uses modern TypeScript features with strict type checking

## Configuration Philosophy

The `tsconfig.json` is based on [Matt Pocock's recommendations](https://www.totaltypescript.com) for library development.

## Key Compiler Options

### Base Options
- `target`: `es2022` - Modern JavaScript output
- `module`: `NodeNext` - Node.js ESM support
- `moduleDetection`: `force` - Treat all files as modules
- `verbatimModuleSyntax`: `true` - Strict import/export syntax
- `esModuleInterop`: `true` - Better CommonJS interop
- `resolveJsonModule`: `true` - Import JSON files

### Strictness (All Enabled)
- `strict`: `true` - All strict checks enabled
- `noUncheckedIndexedAccess`: `true` - Array/object access returns `T | undefined`
- `noImplicitOverride`: `true` - Require explicit `override` keyword

### Build Configuration
- `outDir`: `dist` - Compiled output directory
- `rootDir`: `src` - Source files directory
- `sourceMap`: `true` - Generate source maps
- `declaration`: `true` - Generate `.d.ts` files
- `declarationMap`: `true` - Generate declaration maps (for monorepo support)

### Libraries
- `lib`: `["es2022", "dom", "dom.iterable"]` - Include DOM types for flexibility

## Module System

This project uses **ES Modules (ESM)**:

```json
"type": "module"
```

### Important ESM Rules

1. **Use `.js` extensions in imports** (even for `.ts` files):
   ```typescript
   import add from './index.js';  // Correct
   import add from './index';     // Wrong - will fail at runtime
   ```

2. **File extensions are required** in import statements

3. **No `require()`** - use `import` instead

## Type Safety Best Practices

1. Avoid `any` - use `unknown` if you truly don't know the type
2. Use `noUncheckedIndexedAccess` to catch array bounds issues
3. Leverage TypeScript's inference - don't over-annotate
4. Use strict null checks to catch potential null/undefined issues
