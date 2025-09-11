#!/bin/bash

## Reference Document: https://docs.docker.com/desktop/uninstall/

DOCKER_APP="/Applications/Docker.app"
HELPER_DIR="/Library/PrivilegedHelperTools"

# Check if Docker.app exists
if [ -d "$DOCKER_APP" ]; then
    # Capture Docker Desktop version (if binary responds)
    VERSION=$("$DOCKER_APP/Contents/MacOS/Docker" --version 2>/dev/null | awk '{print $3}')
    
    if [ -n "$VERSION" ]; then
        echo "Docker Desktop version detected: $VERSION"
    else
        echo "Could not determine Docker Desktop version."
    fi

    # Run uninstall script
    echo "Running official Docker uninstall..."
    sudo "$DOCKER_APP/Contents/MacOS/uninstall"

    # Remove residual user files
    echo "Removing user Docker files..."
    sudo /bin/rm -rf ~/Library/Group\ Containers/group.com.docker
    sudo /bin/rm -rf ~/.docker

    # Remove privileged helper tools only if version <= 4.36
    if [ -n "$VERSION" ]; then
        if [ "$(printf '%s\n' "4.36" "$VERSION" | sort -V | head -n1)" = "$VERSION" ]; then
            echo "Version $VERSION <= 4.36 detected. Removing helper tools..."
            sudo /bin/rm -f "$HELPER_DIR/com.docker.vmnetd"
            sudo /bin/rm -f "$HELPER_DIR/com.docker.socket"
        else
            echo "Version $VERSION > 4.36. Skipping helper tools removal."
        fi
    fi

    # Remove the application bundle itself
    echo "Deleting Docker.app from Applications..."
    sudo /bin/rm -rf "$DOCKER_APP"

    echo "✅ Docker Desktop has been fully uninstalled."
else
    echo "No Docker.app found in /Applications. Nothing to uninstall."
fi
