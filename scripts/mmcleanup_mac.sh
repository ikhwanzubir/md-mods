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
    local required_items=("CLAUDE.md")
    local all_present=true
    
    for item in "${required_items[@]}"; do
        if ! check_exists "$item"; then
            all_present=false
        fi
    done
    
    # If any required item is missing, exit
    if [[ "$all_present" == "false" ]]; then
        echo "No CLAUDE.md file detected. Exiting."
        exit 1
    fi
    
    echo "CLAUDE.md file detected. Proceeding with cleanup..."
    
    # Delete specified files  
    echo "Deleting specified files..."
    local files_to_delete=("CLAUDE.md")
    
    for file in "${files_to_delete[@]}"; do
        safe_remove "$file" "file"
    done
    
    echo "✅ CLAUDE.md cleanup completed successfully!"
}

# Run main function
main "$@"