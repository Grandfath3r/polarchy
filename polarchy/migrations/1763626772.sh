echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/polarchy/themes/hackerman ]]; then
  rm -rf ~/.config/polarchy/themes/hackerman
  ln -nfs ~/.local/share/polarchy/themes/hackerman ~/.config/polarchy/themes/
fi
