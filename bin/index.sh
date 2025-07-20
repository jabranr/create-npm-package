#!/usr/bin/env bash

# Enable strict error handling
set -euo pipefail

# Get the directory where this script is located (the package installation directory)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(dirname "$SCRIPT_DIR")"
USER_DIR=$(pwd)
TARGET_DIR="$USER_DIR"

# exit for missing name argument
if [ $# -eq 0 ] || [ -z "${1:-}" ]; then
  echo "Error: --name is required e.g. --name <my_project>"
  exit 1
fi

# exit for missing name argument value
if [ "$1" == "--name" ]; then
  shift
  if [ -z "${1:-}" ]; then
    echo "Error: --name requires a value e.g. --name <my_project>"
    exit 1
  fi
  PROJECT_NAME="$1"
else
  PROJECT_NAME="$1"
fi

# Validate PROJECT_NAME is not empty
if [ -z "$PROJECT_NAME" ]; then
  echo "Error: Project name cannot be empty. e.g --name <my_project> or <my_project>"
  exit 1
fi

TARGET_DIR="$USER_DIR/$PROJECT_NAME"

# exit for existing directory
if [ -d "$TARGET_DIR" ] && [ "$TARGET_DIR" != "$USER_DIR" ]; then
  echo "Error: Target directory '$TARGET_DIR' already exists."
  exit 1
fi

# create target directory
mkdir -p "$TARGET_DIR"
echo "Created target directory: $TARGET_DIR"

# copy template files (including hidden files)
if [[ "$PACKAGE_DIR" == *"/node_modules"* ]]; then
  cp -r "$PACKAGE_DIR/@jabraf/create-npm-package/template/." "$TARGET_DIR/"
else
  cp -r "$PACKAGE_DIR/template/." "$TARGET_DIR/"
fi

echo "Ready to use at $TARGET_DIR"
echo "Run \"cd $TARGET_DIR && npm install\" to get started"

exit 0