#!/bin/bash

# Check if SSH (Remote Login) is enabled
remote_login_status=$(sudo /usr/sbin/systemsetup -getremotelogin)

if [[ "$remote_login_status" == *"On"* ]]; then
    # SSH is enabled → error
    echo "⚠️ SSH is enabled"
    exit 2
else
    # SSH is not enabled → good
    echo "SSH is not enabled"
    exit 0
fi