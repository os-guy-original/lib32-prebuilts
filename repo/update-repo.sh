#!/bin/bash
# Update pacman repository database from packages in current directory
set -e

REPO_NAME="lib32-gtk4-custom"

echo "=== Updating Repository Database ==="

# Find packages in current directory
mapfile -t PACKAGES < <(find . -maxdepth 1 -name "*.pkg.tar.zst" -type f 2>/dev/null | sort)
PKG_COUNT=${#PACKAGES[@]}

echo "Found $PKG_COUNT package(s)"

if [ "$PKG_COUNT" -eq 0 ]; then
    echo "WARNING: No packages found"
    exit 0
fi

# Remove old database
rm -f "$REPO_NAME".db.tar.gz "$REPO_NAME".files.tar.gz

# Create new database
for pkg in "${PACKAGES[@]}"; do
    echo "Adding: $(basename "$pkg")"
    repo-add "$REPO_NAME".db.tar.gz "$pkg"
done

echo ""
ls -lh "$REPO_NAME".db.tar.gz
echo "SUCCESS: Database updated"
