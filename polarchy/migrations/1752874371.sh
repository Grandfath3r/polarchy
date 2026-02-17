echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/polarchy/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/polarchy/themes/catppuccin-latte ~/.config/polarchy/themes/
fi
