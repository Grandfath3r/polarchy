echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/polarchy/themes/ethereal ]]; then
  rm -rf ~/.config/polarchy/themes/ethereal
  ln -nfs ~/.local/share/polarchy/themes/ethereal ~/.config/polarchy/themes/
fi
