# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/polarchy/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$POLARCHY_USER_NAME"
<Multi_key> <space> <e> : "$POLARCHY_USER_EMAIL"
EOF
