echo "Migrate to proper packages for localsend and asdcontrol"

if polarchy-pkg-present localsend-bin; then
  polarchy-pkg-drop localsend-bin
  polarchy-pkg-add localsend
fi

if polarchy-pkg-present asdcontrol-git; then
  polarchy-pkg-drop asdcontrol-git
  polarchy-pkg-add asdcontrol
fi
