# Publishing Workflow

## Package Distribution

This project provides a CLI tool distributed via npm: `@jabraf/create-npm-package`

## GitHub Actions Workflows

The template includes two publishing workflows:

### 1. Pre-release on Pull Requests
**File**: `.github/workflows/pre-release-npm.yml`

Triggers on: `pull_request`

Steps:
1. Run unit tests (`npm test`)
2. Build the package (`npm run build`)
3. Create a prerelease version with git SHA
4. Publish to npm with prerelease tag

### 2. Production Release on Main
**File**: `.github/workflows/publish-npm.yml`

Triggers on: Push to `main` or `master` branch

Steps:
1. Run unit tests
2. Build the package
3. Publish to npm

## Versioning

- Uses npm's semantic versioning
- Prerelease versions: Appended with git commit SHA short hash
- Production versions: Managed manually via `npm version`

## Package Structure

### Main Package (`/`)
- **Entry point**: `bin/index.sh`
- **Files included**: `bin/`, `template/`
- **Type**: CLI tool (shell script)

### Template Package (`/template/`)
- **Entry point**: `dist/index.js` (after build)
- **Files included**: `dist/` directory
- **Type**: ES Module library

## Environment Variables

Publishing requires:
- `NODE_AUTH_TOKEN`: npm authentication token (stored in GitHub Secrets as `NPM_TOKEN`)

## Volta Node Version Management

Both the main package and template use Volta for Node.js version pinning:

```json
"volta": {
  "node": "22.17.0",
  "npm": "10.9.2"
}
```

This ensures consistent Node/npm versions across development and CI/CD.

## Making a Release

1. Ensure all tests pass
2. Update version in `package.json` if needed
3. Push to main branch
4. GitHub Actions will automatically publish to npm

## Package Registry

- Registry: `https://registry.npmjs.org/`
- Access: Public (`"publishConfig": { "access": "public" }`)
- Scope: `@jabraf`
