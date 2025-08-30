#!/bin/bash

# Check if the device has Cisco Secure Endpoint app Installed 
# The Path is "/Applications/Cisco Secure Endpoint/Secure Endpoint Connector.app"

if [ -e "/Applications/Cisco Secure Endpoint/Secure Endpoint Connector.app" ]; then
    echo "Secure Endpoint installed"
    exit 0
else 
    echo "Cisco Secure Endpoint not installed"
# the audit script will fail (exit 0) which will trigger the app installation. 
    exit 1
fi