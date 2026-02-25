#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Polarchy locations
export POLARCHY_PATH="$HOME/.local/share/polarchy"
export POLARCHY_INSTALL="$POLARCHY_PATH/install"
export POLARCHY_INSTALL_LOG_FILE="/var/log/polarchy-install.log"
export PATH="$POLARCHY_PATH/bin:$PATH"

# Make all bin scripts executable
chmod +x $POLARCHY_PATH/bin/*

# Install
source "$POLARCHY_INSTALL/helpers/all.sh"
source "$POLARCHY_INSTALL/preflight/all.sh"
source "$POLARCHY_INSTALL/packaging/all.sh"
source "$POLARCHY_INSTALL/config/all.sh"
source "$POLARCHY_INSTALL/login/all.sh"
source "$POLARCHY_INSTALL/post-install/all.sh"
