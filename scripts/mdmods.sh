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
echo "Cloning md-mods repository..."
if git clone https://github.com/ikhwanzubir/md-mods.git . 2>/dev/null; then
success_msg "Successfully cloned md-mods repository"
else
error_exit "Failed to clone repository. Make sure git is installed and you have internet connection"
fi
echo ""
echo "Setup complete! Now starting Claude..."
echo "Running: claude --dangerously-skip-permissions"
echo ""
# Step 2e: Run claude with custom flag
exec claude --dangerously-skip-permissions