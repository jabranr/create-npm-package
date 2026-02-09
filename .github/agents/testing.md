# Testing Conventions

## Test Framework

This project uses **Vitest** for testing.

## Running Tests

```bash
npm test           # Run all tests once (CI mode)
npm run test       # Same as above
```

## Test File Conventions

- Test files: `*.spec.ts`
- Place test files next to the source files they test (e.g., `index.ts` → `index.spec.ts`)
- Use ESM imports with `.js` extension for TypeScript files:
  ```typescript
  import add from './index.js';  // Note the .js extension
  ```

## Test Structure

```typescript
import { expect, test } from 'vitest';
import yourFunction from './your-file.js';

test('descriptive test name', () => {
  expect(yourFunction(input)).toEqual(expectedOutput);
});
```

## Template Project Tests

The template project (in `/template/`) includes a sample test demonstrating the testing pattern. When making changes to the template, ensure:

1. Tests follow the same patterns as the example
2. Tests use Vitest's built-in assertions
3. Test imports use `.js` extensions for TypeScript files (ESM requirement)

## Integration Testing

For the CLI tool itself (`/bin/index.sh`), there's a basic test script at `/bin/test.sh` for manual validation.
