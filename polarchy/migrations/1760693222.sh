echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/polarchy-cmd-tzupdate/polarchy-launch-floating-terminal-with-presentation polarchy-tz-select/g' ~/.config/waybar/config.jsonc
