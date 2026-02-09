# AI Agent Guidance

This is a CLI tool that scaffolds TypeScript npm packages with a batteries-included template.

## Essentials

- **Package Manager**: npm (not yarn or pnpm)
- **Node Version**: 22.17.0 (managed via Volta)
- **Build**: `npm run build` (uses `tsc`)
- **Test**: `npm test` (uses `vitest run`)
- **Format**: `npm run format` (uses `prettier`)

## Project Structure

- `/bin/` - Shell scripts for the CLI tool
- `/template/` - Template files copied to new projects (the actual package scaffold)

## Detailed Guidance

For detailed information about specific aspects of this project:

- [Testing Conventions](.github/agents/testing.md) - How to write and run tests
- [Code Style & Formatting](.github/agents/code-style.md) - Prettier and code conventions
- [TypeScript Configuration](.github/agents/typescript.md) - TypeScript setup and patterns
- [Publishing Workflow](.github/agents/publishing.md) - Release and versioning process
