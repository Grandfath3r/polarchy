# Install all base packages
mapfile -t packages < <(grep -v '^#' "$POLARCHY_INSTALL/polarchy-base.packages" | grep -v '^$')
polarchy-pkg-add "${packages[@]}"
#sudo yay -S --noconfirm --needed "${packages[@]}"