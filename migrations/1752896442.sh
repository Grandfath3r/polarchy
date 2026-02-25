echo "Replace volume control GUI with a TUI"

if polarchy-cmd-missing wiremix; then
  polarchy-pkg-add wiremix
  polarchy-pkg-drop pavucontrol
  polarchy-refresh-applications
  polarchy-refresh-waybar
fi
