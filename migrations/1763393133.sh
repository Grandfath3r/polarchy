echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $POLARCHY_PATH/default/elephant/polarchy_themes.lua ~/.config/elephant/menus/polarchy_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
polarchy-restart-walker
