#!/bin/bash
# Generate FEATURES.md from PKGBUILD files
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT="$ROOT_DIR/FEATURES.md"

echo "# Feature Detection Report" > "$OUTPUT"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for pkgbuild in $(find "$ROOT_DIR/packages" -name "PKGBUILD" -type f | sort); do
    pkgname=$(basename $(dirname "$pkgbuild"))
    
    echo "## $pkgname" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "| Feature | Status | Build Flag |" >> "$OUTPUT"
    echo "|---------|--------|------------|" >> "$OUTPUT"
    
    # Extract meson options
    grep -oE '\-D[[:space:]]?[a-zA-Z0-9_.-]+=[^[:space:]]+' "$pkgbuild" 2>/dev/null | while read opt; do
        name=$(echo "$opt" | sed 's/-D[[:space:]]*\([^=]*\)=.*/\1/')
        val=$(echo "$opt" | sed 's/.*=//')
        echo "| $name | $val | $opt |" >> "$OUTPUT"
    done
    
    # Extract configure options
    grep -oE '\-\-(en|dis)able-[a-zA-Z0-9_-]+' "$pkgbuild" 2>/dev/null | while read opt; do
        name=$(echo "$opt" | sed 's/--\(en\|dis\)able-//')
        status=$(echo "$opt" | grep -q enable && echo "enabled" || echo "disabled")
        echo "| $name | $status | $opt |" >> "$OUTPUT"
    done
    
    echo "" >> "$OUTPUT"
done

echo "Generated $OUTPUT"
