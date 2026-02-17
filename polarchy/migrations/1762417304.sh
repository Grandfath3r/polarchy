echo "Replace bluetooth GUI with TUI"

polarchy-pkg-add bluetui
polarchy-pkg-drop blueberry

if ! grep -q "polarchy-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/polarchy-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
