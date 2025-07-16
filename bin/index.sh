#!/usr/bin/env bash

THIS_DIR=$(pwd)
TARGET_DIR="$THIS_DIR"

# exit for missing name argument
if [ -z "$1" ]; then
  echo "Error: --name is required e.g. --name <my_project>"
  exit 1
fi

# exit for missing name argument value
if [ "$1" == "--name" ]; then
  shift
  if [ -z "$1" ]; then
    echo "Error: --name requires a value e.g. --name <my_project>"
    exit 1
  fi
fi

TARGET_DIR="$THIS_DIR/$1"

# exit for existing directory
if [ -d "$TARGET_DIR" ] && [ "$TARGET_DIR" != "$THIS_DIR" ]; then
  echo "Error: Target directory '$TARGET_DIR' already exists."
  exit 1
fi

# create target directory
mkdir -p "$TARGET_DIR"
echo "Created target directory: $TARGET_DIR"

# copy template files (including hidden files)
cp -r "$THIS_DIR/template/." "$TARGET_DIR/"

echo "Ready to use at $TARGET_DIR"
echo "Run \"cd $TARGET_DIR && npm install\" to get started"

exit 0