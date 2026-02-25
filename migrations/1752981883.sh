echo "Replace wofi with walker as the default launcher"

if polarchy-cmd-missing walker; then
  polarchy-pkg-add walker-bin libqalculate

  polarchy-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/polarchy/config/walker/* ~/.config/walker/
fi
