#!/usr/bin/env bash

# Tests for index.sh script

# Source directory of tests
TEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$TEST_DIR"
PACKAGE_DIR="$(dirname "$TEST_DIR")"
INDEX_SCRIPT="$BIN_DIR/index.sh"

# Create a temporary directory for testing
TEMP_TEST_DIR=$(mktemp -d)
echo "Created temporary test directory: $TEMP_TEST_DIR"

# Make sure we clean up after ourselves
cleanup() {
  echo "Cleaning up test directory: $TEMP_TEST_DIR"
  rm -rf "$TEMP_TEST_DIR"
}
trap cleanup EXIT

# Function to run tests
run_test() {
  local test_name="$1"
  local expected_exit_code="$2"
  local command="$3"
  
  echo "Running test: $test_name"
  eval "$command"
  local actual_exit_code=$?
  
  if [ "$actual_exit_code" -eq "$expected_exit_code" ]; then
    echo "✅ Test passed: $test_name"
  else
    echo "❌ Test failed: $test_name"
    echo "Expected exit code: $expected_exit_code, Actual: $actual_exit_code"
    exit 1
  fi
}

# Change to test directory
cd "$TEMP_TEST_DIR"

# Test 1: No arguments should fail
run_test "No arguments" 1 "$INDEX_SCRIPT 2>/dev/null || true"

# Test 2: --name without a value should fail
run_test "Missing name value" 1 "$INDEX_SCRIPT --name 2>/dev/null || true"

# Test 3: Valid project name
PROJECT_NAME="test-project"
run_test "Valid project name" 0 "$INDEX_SCRIPT --name $PROJECT_NAME"

# Test 4: Check if directory was created
if [ -d "$TEMP_TEST_DIR/$PROJECT_NAME" ]; then
  echo "✅ Test passed: Directory was created"
else
  echo "❌ Test failed: Directory was not created"
  exit 1
fi

# Test 5: Check if template files were copied
if [ -f "$TEMP_TEST_DIR/$PROJECT_NAME/package.json" ]; then
  echo "✅ Test passed: Template files were copied"
else
  echo "❌ Test failed: Template files were not copied"
  exit 1
fi

# Test 6: Should fail if target directory already exists
run_test "Existing directory" 1 "$INDEX_SCRIPT --name $PROJECT_NAME 2>/dev/null || true"

# Test 7: Test with positional argument
PROJECT_NAME="test-project-2"
run_test "Positional argument" 0 "$INDEX_SCRIPT $PROJECT_NAME"

echo "All tests completed successfully! 🎉"