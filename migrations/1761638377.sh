echo "Turn off fcitx5 clipboard that is interferring with other applications"

mkdir -p ~/.config/fcitx5/conf
cp $POLARCHY_PATH/config/fcitx5/conf/clipboard.conf ~/.config/fcitx5/conf/

polarchy-restart-xcompose
