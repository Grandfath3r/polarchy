echo "Uniquely identify terminal apps with custom app-ids using polarchy-launch-tui"

# Replace terminal -e calls with polarchy-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/polarchy-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use polarchy-launch-or-focus with polarchy-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|polarchy-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.polarchy\.Wiremix -e wiremix|polarchy-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
