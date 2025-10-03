#!/bin/bash

# Function to check if a file or directory exists
check_exists() {
    if [ ! -e "$1" ]; then
        echo "Error: $1 does not exist in the current directory"
        return 1
    fi
    return 0
}

# Check if all required files and folders are present
echo "Checking for required files and folders..."

required_items=("CLAUDE.md")
all_present=true

for item in "${required_items[@]}"; do
    if ! check_exists "$item"; then
        all_present=false
    fi
done

# If any required item is missing, exit
if [ "$all_present" = false ]; then
    echo "No CLAUDE.md file detected. Exiting."
    exit 1
fi

echo "CLAUDE.md file detected. Proceeding with cleanup..."

# Delete specified files
echo "Deleting specified files..."
files_to_delete=("CLAUDE.md")

for file in "${files_to_delete[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "Deleted file: $file"
    else
        echo "Warning: File $file not found."
    fi
done

echo "CLAUDE.md cleanup completed successfully!"
