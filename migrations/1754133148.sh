echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  polarchy-refresh-config waybar/style.css
  polarchy-restart-waybar
fi
