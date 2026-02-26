#!/bin/bash

# Source-safe: handle being sourced by run_logged
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  exec bash "${BASH_SOURCE[0]}" "$@"
fi

# Grab log file from env (set by run_logged)
: "${POLARCHY_INSTALL_LOG_FILE:=/var/log/polarchy-install.log}"

if [ "$EUID" -ne 0 ]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Self-elevating secure-boot.sh to root..." >> "$POLARCHY_INSTALL_LOG_FILE"
  exec sudo bash "$0" "$@"
fi

set -euo pipefail  # +u (unset vars fail), +o pipefail

echo "Setting up Secure Boot for Limine..." | tee -a "$POLARCHY_INSTALL_LOG_FILE"

# Install sbctl if missing
if ! command -v sbctl &>/dev/null; then
  pacman -Syu --noconfirm sbctl  # -yu for safety
fi

# Create/enroll keys
if ! sbctl status | grep -q "Installed: ✓"; then
  sbctl create-keys
  sbctl enroll-keys -m   # Microsoft keys for Windows dual-boot
  echo "Keys enrolled ✓ Reboot + Setup Mode to activate."
else
  echo "Keys already enrolled ✓"
fi

# Sign *all* potential Limine EFIs + kernels
echo "Signing boot files..." | tee -a "$POLARCHY_INSTALL_LOG_FILE"
sbctl verify

# Sign common Limine EFI locations (adjust based on verify output)
for efi in /boot/EFI/BOOT/BOOTX64.EFI /boot/EFI/Limine/limine_x64.efi; do
  if [[ -f "$efi" ]]; then
    sbctl sign --save "$efi"
    echo "Signed: $efi" | tee -a "$POLARCHY_INSTALL_LOG_FILE"
  fi
done

# Sign everything else saved previously
sbctl sign-all

# Enroll limine.cfg (Limine-specific)
if [ -f /boot/limine.cfg ]; then
  limine-enroll-config /boot/limine.cfg
else
  echo "Warning: /boot/limine.cfg missing (Limine config unsigned)"
fi

# Auto-sign hooks (critical for pacman updates)
sbctl install-hooks

echo "Secure Boot enabled for Limine!"
echo "Next: reboot → BIOS → Secure Boot ON → verify 'sbctl status'" | tee -a "$POLARCHY_INSTALL_LOG_FILE"