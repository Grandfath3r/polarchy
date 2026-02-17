echo "Add Tmux as an option with themed styling"

polarchy-pkg-add tmux

if [[ ! -f ~/.config/tmux/tmux.conf ]]; then
  mkdir -p ~/.config/tmux
  cp $POLARCHY_PATH/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
  polarchy-theme-refresh
fi
