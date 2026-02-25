echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/polarchy/themes/ristretto ]]; then
  ln -nfs ~/.local/share/polarchy/themes/ristretto ~/.config/polarchy/themes/
fi
