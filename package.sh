#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

# Copy shared components directly
cp -r "$SCRIPT_DIR/shared" "$DIST_DIR/shared"

# Copy prompts/ from each project
for project in referee copyedit parsepdf econ_ra; do
    cp -r "$SCRIPT_DIR/$project/prompts" "$DIST_DIR/$project"
done

# Copy econ_ra templates (useful starting points)
cp -r "$SCRIPT_DIR/econ_ra/templates" "$DIST_DIR/econ_ra/templates"

# Fix relative paths for dist:
# 1. ../../ → ../  (adjust depth)
# 2. /prompts/ → / (remove prompts from paths)
find "$DIST_DIR" -name "*.prompt" -exec sed -i '' -e 's|\.\./\.\./|../|g' -e 's|/prompts/|/|g' {} \;

echo "Done! Packaged to: $DIST_DIR"
