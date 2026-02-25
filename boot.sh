#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export POLARCHY_ONLINE_INSTALL=true

ansi_art='                 
   ▄███████▄  ▄██████▄   ▄█          ▄████████    ▄████████  ▄████████    ▄█    █▄    ▄██   ▄  
  ███    ███ ███    ███ ███         ███    ███   ███    ███ ███    ███   ███    ███   ███   ██▄
  ███    ███ ███    ███ ███         ███    ███   ███    ███ ███    █▀    ███    ███   ███▄▄▄███
  ███    ███ ███    ███ ███         ███    ███  ▄███▄▄▄▄██▀ ███         ▄███▄▄▄▄███▄▄ ▀▀▀▀▀▀███
▀█████████▀  ███    ███ ███       ▀███████████ ▀▀███▀▀▀▀▀   ███        ▀▀███▀▀▀▀███▀  ▄██   ███
  ███        ███    ███ ███         ███    ███ ▀███████████ ███    █▄    ███    ███   ███   ███
  ███        ███    ███ ███▌    ▄   ███    ███   ███    ███ ███    ███   ███    ███   ███   ███
 ▄████▀       ▀██████▀  █████▄▄██   ███    █▀    ███    ███ ████████▀    ███    █▀     ▀█████▀ 
                                                 ███    ███                                    
'
clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/polarchy
POLARCHY_REPO="${POLARCHY_REPO:-Grandfath3r/polarchy}"

echo -e "\nCloning Polarchy from: https://github.com/${POLARCHY_REPO}.git"
rm -rf ~/.local/share/polarchy/
git clone "https://github.com/${POLARCHY_REPO}.git" ~/.local/share/polarchy >/dev/null

# Use custom branch if instructed, otherwise default to main
POLARCHY_REF="${POLARCHY_REF:-main}"
echo -e "\e[32mUsing branch: $POLARCHY_REF\e[0m"
cd ~/.local/share/polarchy
git fetch origin "${POLARCHY_REF}" && git checkout "${POLARCHY_REF}"
cd -

echo -e "\nInstallation starting..."
source ~/.local/share/polarchy/install.sh
