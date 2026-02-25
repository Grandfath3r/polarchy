echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Polarchy --title Polarchy -e polarchy-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Polarchy --title Polarchy -e \)polarchy-update"|\1polarchy-update"|' ~/.config/waybar/config.jsonc
  polarchy-restart-waybar
fi
