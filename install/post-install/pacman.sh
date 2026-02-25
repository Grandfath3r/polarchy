# Refresh keys
sudo pacman-key --populate archlinux 2>/dev/null || true
sudo pacman -Syyu  # ensure system is current

# T2 Mac support
if lspci -nn | grep -q "106b:180[12]"; then
  cat <<EOF | sudo tee -a /etc/pacman.conf >/dev/null
  
[arch-mact2]
Server = https://github.com/NoaHimesaka1873/arch-mact2-mirror/releases/download/release
SigLevel = Never
EOF
  sudo pacman -Syy
fi