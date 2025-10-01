#!/bin/bash

# macOS Compatible Cleanup Script
# Compatible with macOS Monterey, Ventura, Sonoma, and Sequoia

set -euo pipefail  # Exit on error, undefined variables, and pipe failures

# Function to check if a file or directory exists
check_exists() {
    if [[ ! -e "$1" ]]; then
        echo "Error: $1 does not exist in the current directory"
        return 1
    fi
    return 0
}

# Function to safely remove files/directories
safe_remove() {
    local target="$1"
    local type="$2"
    
    if [[ "$type" == "file" && -f "$target" ]]; then
        rm "$target" && echo "Deleted file: $target"
    elif [[ "$type" == "directory" && -d "$target" ]]; then
        rm -rf "$target" && echo "Deleted folder: $target"
    else
        echo "Warning: $type $target not found."
    fi
}

# Main execution
main() {
    echo "macOS Cleanup Script - Starting..."
    
    # Check if all required files and folders are present
    echo "Checking for required files and folders..."
    local required_items=(".claude" "scripts" "CLAUDE.md")
    local all_present=true
    
    for item in "${required_items[@]}"; do
        if ! check_exists "$item"; then
            all_present=false
        fi
    done
    
    # If any required item is missing, exit
    if [[ "$all_present" == "false" ]]; then
        echo "Not all required files and folders are present. Exiting."
        exit 1
    fi
    
    echo "All required files and folders are present. Proceeding with cleanup..."
    
    # Delete specified folders
    echo "Deleting specified folders..."
    local folders_to_delete=(".git" ".claude" "scripts")
    
    for folder in "${folders_to_delete[@]}"; do
        safe_remove "$folder" "directory"
    done
    
    # Delete specified files  
    echo "Deleting specified files..."
    local files_to_delete=("CLAUDE.md" "LICENSE")
    
    for file in "${files_to_delete[@]}"; do
        safe_remove "$file" "file"
    done
    
    echo "✅ Markdown files cleanup completed successfully!"
}

# Run main function
main "$@"