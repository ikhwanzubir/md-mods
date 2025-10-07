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
md_files=(*.md)
if [ ! -f "${md_files[0]}" ]; then
    error_exit "Current directory must contain at least one markdown file"
fi
success_msg "Found markdown file(s) in directory"

echo "Downloading CLAUDE.md file..."

# Download the specific file using curl or wget
if command -v curl &> /dev/null; then
    if curl -fsSL -o CLAUDE.md "https://raw.githubusercontent.com/ikhwanzubir/md-mods/refs/heads/main/CLAUDE.md"; then
        success_msg "Successfully downloaded CLAUDE.md"
    else
        error_exit "Failed to download file using curl. Check your internet connection"
    fi
elif command -v wget &> /dev/null; then
    if wget -q -O CLAUDE.md "https://raw.githubusercontent.com/ikhwanzubir/md-mods/refs/heads/main/CLAUDE.md"; then
        success_msg "Successfully downloaded CLAUDE.md"
    else
        error_exit "Failed to download file using wget. Check your internet connection"
    fi
else
    error_exit "Neither curl nor wget is installed. Please install one of them"
fi

echo ""
echo "Setup complete! Now starting Claude..."
echo "Running: claude --dangerously-skip-permissions"
echo ""

# Step 2e: Run claude with custom flag
exec claude --model opus --dangerously-skip-permissions