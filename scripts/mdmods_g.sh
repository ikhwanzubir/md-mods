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
echo "Downloading GEMINI.md file..."
# Download the specific file using curl or wget
if command -v curl &> /dev/null; then
if curl -fsSL -o GEMINI.md "https://raw.githubusercontent.com/ikhwanzubir/md-mods/refs/heads/main/GEMINI.md"; then
success_msg "Successfully downloaded GEMINI.md"
else
error_exit "Failed to download file using curl. Check your internet connection"
fi
elif command -v wget &> /dev/null; then
if wget -q -O GEMINI.md "https://raw.githubusercontent.com/ikhwanzubir/md-mods/refs/heads/main/GEMINI.md"; then
success_msg "Successfully downloaded GEMINI.md"
else
error_exit "Failed to download file using wget. Check your internet connection"
fi
else
error_exit "Neither curl nor wget is installed. Please install one of them"
fi
echo ""
echo "Setup complete! Now starting Gemini CLI..."
echo "Running: Gemini CLI"
echo ""
# Step 2e: Run gemini with custom flag
exec gemini --yolo