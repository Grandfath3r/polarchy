echo "Adding Polarchy version info to fastfetch"
if ! grep -q "polarchy" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/polarchy/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

