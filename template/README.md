# Create npm package

This project boilerplate is created with `@jabraf/create-npm-package`.

## CI

Basic npm publish and npm pre-release publish jobs are already setup in `.github/workflows` directory.

> The PRs with will create a pre-release version in npm automatically.

## Notes

In order for it to work, it needs:

- `NPM_TOKEN` secret set in GitHub repository
- manual version bump i.e. `npm version {major|minor|patch}`

&copy; 2025 - Jabran Rafique
