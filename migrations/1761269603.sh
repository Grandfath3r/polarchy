echo "Add right-click terminal action to waybar polarchy menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f "$WAYBAR_CONFIG" ]] && ! grep -A5 '"custom/polarchy"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "polarchy-menu",/a\    "on-click-right": "polarchy-launch-terminal",' "$WAYBAR_CONFIG"
fi
