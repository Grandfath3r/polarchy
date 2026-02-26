#!/bin/bash
set -e

echo "Setting up Secure Boot for Limine..."

# Install sbctl
if ! command -v sbctl &>/dev/null; then
  pacman -S --noconfirm sbctl
fi

# Create and enroll keys (requires Setup Mode)
if ! sbctl status | grep -q "Installed: ✓"; then
  echo "Creating Secure Boot keys..."
  sbctl create-keys
  
  echo "Enrolling keys (Microsoft + custom)..."
  sbctl enroll-keys -m
  
  echo "Keys enrolled. Reboot to Setup Mode if needed."
else
  echo "Keys already enrolled."
fi

# Sign Limine EFI binaries (adjust paths if needed)
echo "Signing Limine binaries..."
for file in /boot/EFI/limine/BOOTX64.EFI /boot/EFI/BOOT/BOOTX64.EFI; do
  if [ -f "$file" ]; then
    sbctl sign -s "$file" || echo "Warning: Failed to sign $file"
  fi
done

# Enroll Limine config hash
if [ -f /boot/limine.cfg ]; then
  echo "Enrolling limine.cfg hash..."
  limine-enroll-config /boot/limine.cfg
else
  echo "Warning: /boot/limine.cfg not found"
fi

# Install auto-sign hooks for future updates
sbctl install-hooks

echo "Secure Boot setup complete!"
echo "1. Reboot and verify Secure Boot in BIOS"
echo "2. Test boot - Limine should now work with Secure Boot enabled"
echo "3. Run 'sbctl status' and 'sbctl verify' to confirm"

# Show status
sbctl status