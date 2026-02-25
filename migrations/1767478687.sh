echo "Add opencode with system themeing"

polarchy-pkg-add opencode

# Add config using polarchy theme by default
if [[ ! -f ~/.config/opencode/opencode.json ]]; then
  mkdir -p ~/.config/opencode
  cp $POLARCHY_PATH/config/opencode/opencode.json ~/.config/opencode/opencode.json
fi
