#!/bin/bash
# Clean build artifacts
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Cleaning build directories..."
find "$PROJECT_ROOT/packages" -type d \( -name "pkg" -o -name "src" \) -exec rm -rf {} + 2>/dev/null || true
echo "Done"
