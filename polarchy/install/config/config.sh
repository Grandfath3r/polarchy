# Copy over Polarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/polarchy/config/* ~/.config/

# Use default bashrc from Polarchy
cp ~/.local/share/polarchy/default/bashrc ~/.bashrc
