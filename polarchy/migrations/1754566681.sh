echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/polarchy/themes/osaka-jade ]]; then
  rm -rf ~/.config/polarchy/themes/osaka-jade
  git -C ~/.local/share/polarchy checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/polarchy/themes/osaka-jade ~/.config/polarchy/themes/osaka-jade
fi
