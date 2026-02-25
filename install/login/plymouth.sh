if [ "$(plymouth-set-default-theme)" != "polarchy" ]; then
  sudo cp -r "$HOME/.local/share/polarchy/default/plymouth" /usr/share/plymouth/themes/polarchy/
  sudo plymouth-set-default-theme polarchy
fi
