# Install all base packages
mapfile -t packages < <(grep -v '^#' "$POLARCHY_INSTALL/polarchy-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
