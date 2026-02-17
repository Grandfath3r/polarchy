echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "polarchy-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  polarchy-refresh-hypridle
  polarchy-refresh-hyprlock
fi
