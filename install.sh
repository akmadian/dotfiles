ln -s ~/repos/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/repos/dotfiles/.config/fish ~/.config/fish
ln -s ~/repos/dotfiles/.config/dwm ~/.config/dwm

rsync -rvcE --inplace ~/repos/dotfiles/.local/bin/ ~/.local/bin/
