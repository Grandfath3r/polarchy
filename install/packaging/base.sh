# Install all base packages
mapfile -t packages < <(grep -v '^#' "$POLARCHY_INSTALL/polarchy-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

for pkg in "${all_packages[@]}"; do
    if pacman -Si "$pkg" >/dev/null 2>&1; then
        # Official repo: use pacman
        sudo pacman -S --noconfirm --needed "$pkg"
    else
        # AUR: use yay
        yay -S --noconfirm --needed "$pkg"
    fi
done
