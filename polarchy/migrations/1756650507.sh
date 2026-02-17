echo "Fix JetBrains font setting"

if [[ $(polarchy-font-current) == JetBrains* ]]; then
  polarchy-font-set "JetBrainsMono Nerd Font"
fi
