#!/bin/sh

echo "Creating symlinks"
set -x
ln -sf ~/dotfiles/.zshrc           ~/.zshrc
ln -sf ~/dotfiles/.nvimrc          ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tmux.conf       ~/.tmux.conf
ln -sf ~/dotfiles/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
ln -sf ~/dotfiles/.Xresources      ~/.Xresources

