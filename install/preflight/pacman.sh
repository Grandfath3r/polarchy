#!/bin/bash
# Verify pacman works
if ! sudo pacman -Syy >/dev/null 2>&1; then
  echo "ERROR: pacman sync failed. Check /etc/pacman.d/mirrorlist"
  exit 1
fi

# Keys refresh
sudo pacman-key --populate archlinux 2>/dev/null || true