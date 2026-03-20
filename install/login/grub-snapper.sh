#!/bin/bash

# GRUB + snapper integration

set -euo pipefail

POLARCHY_PATH=${POLARCHY_PATH:-$HOME/.local/share/polarchy}

# Only run if grub is installed
if ! command -v grub-mkconfig &>/dev/null; then
  echo "GRUB not found, skipping grub-snapper setup"
  return 0
fi

# Try to install grub-btrfs + snapper if pacman is present
if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm --needed grub-btrfs snapper || true
fi

# Always ensure snapper configs exist
if ! sudo snapper list-configs 2>/dev/null | grep -q "root"; then
  sudo snapper -c root create-config /
fi

if ! sudo snapper list-configs 2>/dev/null | grep -q "home"; then
  sudo snapper -c home create-config /home
fi

# Enable quota to allow space-aware algorithms to work
sudo btrfs quota enable / || true

# Tweak default Snapper configs (same tuning as before)
if [[ -f /etc/snapper/configs/root ]]; then
  sudo sed -i 's/^TIMELINE_CREATE="yes"/TIMELINE_CREATE="no"/' /etc/snapper/configs/root
  sudo sed -i 's/^NUMBER_LIMIT="50"/NUMBER_LIMIT="5"/' /etc/snapper/configs/root
  sudo sed -i 's/^NUMBER_LIMIT_IMPORTANT="10"/NUMBER_LIMIT_IMPORTANT="5"/' /etc/snapper/configs/root
  sudo sed -i 's/^SPACE_LIMIT="0.5"/SPACE_LIMIT="0.3"/' /etc/snapper/configs/root
  sudo sed -i 's/^FREE_LIMIT="0.2"/FREE_LIMIT="0.3"/' /etc/snapper/configs/root
fi

if [[ -f /etc/snapper/configs/home ]]; then
  sudo sed -i 's/^TIMELINE_CREATE="yes"/TIMELINE_CREATE="no"/' /etc/snapper/configs/home
  sudo sed -i 's/^NUMBER_LIMIT="50"/NUMBER_LIMIT="5"/' /etc/snapper/configs/home
  sudo sed -i 's/^NUMBER_LIMIT_IMPORTANT="10"/NUMBER_LIMIT_IMPORTANT="5"/' /etc/snapper/configs/home
  sudo sed -i 's/^SPACE_LIMIT="0.5"/SPACE_LIMIT="0.3"/' /etc/snapper/configs/home
  sudo sed -i 's/^FREE_LIMIT="0.2"/FREE_LIMIT="0.3"/' /etc/snapper/configs/home
fi

# Enable grub-btrfs daemon if present (for snapshot entries in GRUB menu)
if systemctl list-unit-files | grep -q '^grub-btrfsd.service'; then
  chrootable_systemctl_enable grub-btrfsd.service
fi

echo "Regenerating GRUB configuration..."

if [[ -d /boot/grub ]]; then
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
  echo "Warning: /boot/grub not found; skipping grub-mkconfig"
fi

echo "GRUB + snapper setup complete"
