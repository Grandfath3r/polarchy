echo "Ensure all indexes and packages are up to date"

polarchy-refresh-pacman
sudo pacman -Syu --noconfirm
