echo "Add minimal starship prompt to terminal"

if polarchy-cmd-missing starship; then
  polarchy-pkg-add starship
  cp $POLARCHY_PATH/config/starship.toml ~/.config/starship.toml
fi
