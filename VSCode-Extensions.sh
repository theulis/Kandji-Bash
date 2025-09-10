#!/bin/bash

# Get the main user by filtering out system users from /Users directory
local_user=$(sudo ls -l /Users | grep -v '^total' | awk '{print $3}' | grep -v -e 'root' | grep -v -i 'admin' | head -1)

# VSCode Extenstion Folder
vsc_extensions="/Users/$local_user/.vscode/extensions"

if ls -d "$vsc_extensions"/googlecloudtools.firebase-data-connect-* >/dev/null 2>&1; then
  echo "Compromised by Firebase Data Connect extension"
  exit 2
fi

if ls -d "$vsc_extensions"/oxc.oxc-* >/dev/null 2>&1; then
  echo "Compromised by oxc extension"
  exit 2
fi

if ls -d "$vsc_extensions"/kilocode-ai.kilocode-ai-* >/dev/null 2>&1; then
  echo "Compromised by Kilo Code AI Agent extension"
  exit 2
fi

echo "No compromises found"
exit 0