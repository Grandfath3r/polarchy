echo "Update fastfetch config with new Polarchy logo"

polarchy-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/polarchy/branding
cp $POLARCHY_PATH/icon.txt ~/.config/polarchy/branding/about.txt
