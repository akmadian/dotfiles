#!/bin/sh

echo "Creating dotfiles src at ~/src/dotfiles"
sudo mkdir -p ~/src/dotfiles

echo "Copying dotfiles repo from descartes to dotfiles src"
cp -r ~/descartes/src/dotfiles/* ~./src/dotfiles/

echo "Creating symlinks"
ln -sf ~/src/dotfiles/.bashrc ~/.bashrc
ln -sf ~/src/dotfiles/scripts/nas.sh ~/nas.sh
ln -sf ~/src/dotfiles/scripts/ovpn.sh ~/ovpn.sh

echo "Setting execution privileges for scripts"
chmod a+rx ~/nas.sh
chmod a+rx ~/ovpn.sh