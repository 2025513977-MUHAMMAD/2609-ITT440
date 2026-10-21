#!/bin/bash

# Check if list.txt exists in the current directory
if [ ! -f "list.txt" ]; then
    echo "Error: list.txt not found in the current directory!"
    exit 1
fi

# Read list.txt line by line
while IFS= read -r folder || [ -n "$folder" ]; do
    # Remove any trailing carriage return characters (for Windows compatibility)
    folder=$(echo "$folder" | tr -d '\r')

    # Skip empty lines
    if [ -z "$folder" ]; then
        continue
    fi

    # Create the folder (including parent directories if needed)
    mkdir -p "$folder"

    # Create README.md and write the formatted content
    echo "# $folder" > "$folder/README.md"

    echo "Successfully created: $folder/README.md"
done < list.txt

echo "All folders and README files have been created!"