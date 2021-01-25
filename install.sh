#!/bin/sh

echo "Creating Symlinks"
set -x

#ln -sf ~/dotfiles/.zshrc           ~/.zshrc
ln -sf ~/dotfiles/config.fish      ~/.config/fish/config.fish
ln -sf ~/dotfiles/.nvimrc          ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tmux.conf       ~/.tmux.conf
#ln -sf ~/dotfiles/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
# ln -sf ~/dotfiles/.Xresources      ~/.Xresources
ln -sf ~/dotfiles/kitty.conf       ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/git/.gitconfig   ~/.gitconfig

chmod +x ~/dotfiles/scripts/swao.sh
sudo ln -sf ~/dotfiles/scripts/swao.sh /bin/swao
