echo "Update Waybar for new Polarchy menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  polarchy-refresh-waybar
fi
