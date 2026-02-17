echo "Move Polarchy Package Repository after Arch core/extra/multilib and remove AUR"

polarchy-refresh-pacman
sudo pacman -Syu --noconfirm
