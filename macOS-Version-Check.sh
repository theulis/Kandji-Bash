#!/bin/bash

## Checks if the device has installed minimum acceptable version
## Change required_version variable

# Get current macOS version
current_version=$(sw_vers --productVersion)

# Define minimum required version
required_version="15.6.1"

# Function to normalize version strings to 3 components
normalize_version() {
    IFS='.' read -r major minor patch <<< "$1"
    patch=${patch:-0}
    echo "$major.$minor.$patch"
}

# Normalize both versions
normalized_current=$(normalize_version "$current_version")
normalized_required=$(normalize_version "$required_version")

# Compare using sort -V
if [[ $(printf "%s\n%s" "$normalized_required" "$normalized_current" | sort -V | head -n1) == "$normalized_required" ]] && \
   [[ "$normalized_current" != "$normalized_required" || "$current_version" == "$required_version" ]]; then
    echo "PASS. The device is running macOS version: $current_version"
else
    echo "FAIL.The device is running macOS version: $current_version"
    sudo /usr/local/bin/kandji display-alert --title "IT Alert" --message "your Mac is running an outdated version of macOS ($current_version). Please update it as soon as possible to stay secure and supported."
fi