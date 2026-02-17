echo "Install Impala as new wifi selection TUI"

if polarchy-cmd-missing impala; then
  polarchy-pkg-add impala
  polarchy-refresh-waybar
fi
