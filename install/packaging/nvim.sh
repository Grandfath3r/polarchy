#!/bin/sh
# Install LazyVim + themes

LAZYVIM="$HOME/.local/share/nvim/lazyvim"
rm -rf "$HOME/.local/share/nvim" "$HOME/.config/nvim"

git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

nvim --headless -c 'autocmd User LazySync quitall' -c 'Lazy sync' -c 'qa'
