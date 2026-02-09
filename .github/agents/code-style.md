# Code Style & Formatting

## Formatter

This project uses **Prettier** for code formatting via the `@jabraf/prettier` configuration package.

## Running Prettier

```bash
npm run format     # Format all files
```

## Configuration

- The prettier configuration is defined in `package.json`:
  ```json
  "prettier": "@jabraf/prettier"
  ```
- Prettier runs automatically via `lint-staged` on all files in pre-commit hooks

## Pre-commit Hooks

The project uses `lint-staged` to check formatting before commits:

```json
"lint-staged": {
  "*": ["prettier --check"]
}
```

## Code Style Guidelines

1. **Follow Prettier's decisions** - Don't fight the formatter
2. **Consistent naming**:
   - camelCase for variables and functions
   - PascalCase for types and interfaces
   - UPPER_SNAKE_CASE for constants
3. **TypeScript best practices**:
   - Enable all strict mode options
   - Use explicit types for function parameters and returns
   - Prefer `const` over `let`, avoid `var`

## Template Project

The template includes the same formatting setup. Generated projects will have:
- Prettier via `@jabraf/prettier`
- `lint-staged` configuration
- Pre-configured format script
