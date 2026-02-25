echo "Add new matte black theme"

if [[ ! -L "~/.config/polarchy/themes/matte-black" ]]; then
  ln -snf ~/.local/share/polarchy/themes/matte-black ~/.config/polarchy/themes/
fi
