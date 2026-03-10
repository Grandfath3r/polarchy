# Polarchy logo in a font for Waybar use
mkdir -p ~/.local/share/fonts
cp ~/.local/share/polarchy/config/polarchy.ttf ~/.local/share/fonts/
if command -v fc-cache >/dev/null; then
  fc-cache -fv
else
  echo "fontconfig not available; skipping font cache update (fonts will load next login)"
fi
