#!/bin/sh

# Check if a directory argument was passed
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a directory"
    exit 1
fi

# If 'tree' is installed, use it
if command -v tree >/dev/null 2>&1; then
    tree -I '*.pyc|*.swp|__init__' "$DIR"
else
    # Fallback: Simulate a tree view
    find "$DIR" | grep -vE 'pyc|swp|__init' | sed -e 's/[^-][^/]*\// |/g' -e 's/| \([^ ]\)/|- \1/'
fi
