echo "Install swayOSD to show volume status"

if polarchy-cmd-missing swayosd-server; then
  polarchy-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
