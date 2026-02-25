echo "Allow updating of timezone by right-clicking on the clock (or running polarchy-cmd-tzupdate)"

if polarchy-cmd-missing tzupdate; then
  bash "$POLARCHY_PATH/install/config/timezones.sh"
  polarchy-refresh-waybar
fi
