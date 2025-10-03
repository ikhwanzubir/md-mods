#!/bin/bash

# Function to display error messages
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Function to display success messages
success_msg() {
    echo "✓ $1"
}

echo "Checking current directory for required files..."

# Check for at least one markdown file
shopt -s nullglob
md_files=(*.md)
shopt -u nullglob

if [ ${#md_files[@]} -eq 0 ]; then
    error_exit "Current directory must contain at least one markdown file"
fi
success_msg "Found markdown file(s) in directory"

echo "Downloading CLAUDE.md file..."

# Download the specific file using curl (preferred on macOS)
if curl -fsSL -o CLAUDE.md "https://raw.githubusercontent.com/ikhwanzubir/md-mods/refs/heads/main/CLAUDE.md"; then
    success_msg "Successfully downloaded CLAUDE.md"
else
    error_exit "Failed to download file. Check your internet connection"
fi

echo ""
echo "Setup complete! Now starting Claude..."
echo "Running: claude --dangerously-skip-permissions"
echo ""

# Run claude with custom flag
exec claude --dangerously-skip-permissions