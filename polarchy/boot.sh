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
                        ▀                        ███    ███                                    

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/polarchy
POLARCHY_REPO="${POLARCHY_REPO:-basecamp/polarchy}"

echo -e "\nCloning Polarchy from: https://github.com/${POLARCHY_REPO}.git"
rm -rf ~/.local/share/polarchy/
git clone "https://github.com/${POLARCHY_REPO}.git" ~/.local/share/polarchy >/dev/null

# Use custom branch if instructed, otherwise default to master
POLARCHY_REF="${POLARCHY_REF:-master}"
echo -e "\e[32mUsing branch: $POLARCHY_REF\e[0m"
cd ~/.local/share/polarchy
git fetch origin "${POLARCHY_REF}" && git checkout "${POLARCHY_REF}"
cd -

# Set edge mirror for dev installs
if [[ $POLARCHY_REF == "dev" ]]; then
  export POLARCHY_MIRROR=edge
else
  export POLARCHY_MIRROR=stable
fi

echo -e "\nInstallation starting..."
source ~/.local/share/polarchy/install.sh
