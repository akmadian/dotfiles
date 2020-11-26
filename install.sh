#!/bin/sh

echo "Creating dotfiles src at ~/src/dotfiles"
sudo mkdir -p ~/src/dotfiles

echo "Copying dotfiles repo from descartes to dotfiles src"
sudo cp -r ~/descartes/src/dotfiles/* ~/src/dotfiles

echo "Creating symlinks"
# Dotfiles
sudo ln -sf ~/src/dotfiles/bash/.bashrc ~/.bashrc
sudo ln -sf ~/src/dotfiles/bash/.alias ~/.bash_alias
sudo ln -sf ~/src/dotfiles/bash/.prompt ~/.bash_prompt
sudo ln -sf ~/src/dotfiles/bash/.path ~/.path
sudo ln -sf ~/src/dotfiles/bash/.functions ~/.bash_functions
sudo ln -sf ~/src/dotfiles/bash/.profile ~/.profile

sudo ln -sf ~/src/dotfiles/git/.gitconfig ~/.gitconfig