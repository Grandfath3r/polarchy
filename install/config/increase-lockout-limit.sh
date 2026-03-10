#!/bin/bash
# Increase lockout limit to 10 and decrease timeout to 2 minutes
# Use /etc/security/faillock.conf instead of editing PAM files directly

set -euo pipefail

sudo mkdir -p /etc/security

sudo tee /etc/security/faillock.conf > /dev/null << 'EOF'
# Polarchy faillock configuration
# Allow up to 10 failed attempts before lockout
deny = 10

# Lockout duration in seconds (2 minutes)
unlock_time = 120

# Don't show faillock messages on TTY
silent
EOF
