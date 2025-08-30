#!/bin/bash

# Cisco Secure Client version follows the version scheme 5.1.11.388
# 5 -- Major release
# 0 -- Minor release
# 02075 -- Build number

# This script checks if the version is greater than or equal to a hardcoded version (here 5.1.11.388)
# If it is, the script exits with status 0
# If it is not, the script exits with status 1
# Release Notes https://www.cisco.com/c/en/us/td/docs/security/vpn_client/anyconnect/Cisco-Secure-Client-5/release/notes/release-notes-cisco-secure-client-5-1.html
# This will be used as an Audit Check in Kandji, so the devices that running an older version, will be automatically be updated to the latest version


# Run the command and capture the output
output=$(/opt/cisco/secureclient/bin/vpn -v)

# Use sed to extract the version number
version=$(echo "$output" | sed -n 's/Cisco Secure Client (version \([^)]*\)).*/\1/p')

# Compare the version and exit accordingly
# Change the version number to the latest version

# Split version strings into arrays for comparison
IFS='.' read -ra current_version <<< "$version"
IFS='.' read -ra required_version <<< "5.1.11.388"

# Compare each segment
version_ok=true
for ((i=0; i<${#current_version[@]}; i++)); do
    if [ "${current_version[i]}" -lt "${required_version[i]}" ]; then
        version_ok=false
        break
    elif [ "${current_version[i]}" -gt "${required_version[i]}" ]; then
        break
    fi
done

if [ "$version_ok" = true ]; then
    echo "The curent Cisco Secure Client version ($version) is greater than or equal to 5.1.11.388"
    exit 0
else
    echo "The current Cisco Secure Client version ($version) is lower than the enforced version 5.1.11.388"
    exit 1
fi
