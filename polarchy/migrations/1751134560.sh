echo "Add UWSM env"

export POLARCHY_PATH="$HOME/.local/share/polarchy"
export PATH="$POLARCHY_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export POLARCHY_PATH=$HOME/.local/share/polarchy
export PATH=$POLARCHY_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
polarchy-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/polarchy/migrations
touch ~/.local/state/polarchy/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old Polarchy installs
polarchy-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $POLARCHY_PATH/migrations/1756060611.sh
touch ~/.local/state/polarchy/migrations/1756060611.sh

bash polarchy-update-perform
