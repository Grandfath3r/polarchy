echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/polarchy/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/polarchy/themes/flexoki-light ~/.config/polarchy/themes/
fi
