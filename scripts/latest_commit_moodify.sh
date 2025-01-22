#!/bin/bash

# Get the list of new moodify
latest_moodify=$(git diff-tree --no-commit-id --name-only -r HEAD HEAD~)

# Convert latest_files to an array
IFS=$'\n' read -rd '' -a latest_moodify_array <<<"$latest_moodify"

# Delete all moodify in the moodify directory that are not in the latest commit
for file in $(find ./moodify -type f -name '*.png'); do
    relative_moodify=${file#./}
    if [[ ! "${latest_moodify_array[*]}" =~ "${relative_bufo}" ]]; then
        rm "$file"
    fi
done

echo "Only moodify from the latest commit remain."
