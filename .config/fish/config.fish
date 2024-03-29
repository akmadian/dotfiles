# Generic PATH append format:
#   set -Ua fish_user_paths [location]

set -Ua fish_user_paths $HOME/cs/CSE-374/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -Ua fish_user_paths $HOME/repos/clones/flutter/bin
set -Ua fish_user_paths $HOME/.pub-cache/bin
set -Ux GPG_TTY (tty)
set -x TMPDIR "/tmp"
set -Ux EDITOR nvim
set -Ux BROWSER librewolf
set -Ux CHROME_BROWSER librewolf
# set -Ux MANPAGER "nvim -c 'set ft=man'"
set -Ux MANPAGER "bat"

set fish_color_command white
set fish_greeting

# Git
alias gs="git status"
alias gp="git push"
alias ga="git add"
alias gaa="git add ."
alias gd="git diff"
alias gc="git commit -m"
alias orm="bash orm" # No idea why, but this script really wants to be run with bash

# Package Managers
alias pi="sudo pacman -S"
alias psyu="sudo pacman -Syyu"
alias pclean="sudo pacman -Rns (pacman -Qtdq)"
alias yi="yay -S"
alias pr="sudo pacman -R"

# Change ls to exa
alias ll="exa -al --color=always --group-directories-first --header"
alias tree="exa --tree --level=2"

alias grep='grep --color=auto'
alias cat='bat'

# General
alias cls="clear"
alias ssn="sudo shutdown now"
alias srn="sudo reboot"
alias sleep="systemctl suspend"
alias bl="sudo bl" # Backlight
alias cb="cbonsai -L 50 -s (random)" # For a pretty tree
alias xcs="xclip -selection c"

alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias rs="rsync -raP --info=progress2"

alias fishconfig='nvim ~/.config/fish/config.fish'
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias so='source ~/.config/fish/config.fish'

# Navigation
alias ..="cd .."
alias cdd="cd ~/Downloads"
alias q="exit"
abbr -a -- - 'cd -' # Cause alias - doesn't work

alias s="startx"
alias c="clear && pwd && ll"

# Recursively removes x perm from all files in working dir, ignores dirs
alias deexec="find . -type f -print0 | xargs -0 chmod -x"

# neofetch --disable Kernel Shell Resolution Theme Icons --off

function fish_prompt
    set_color normal
    set git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')

    # set_color C9B091; echo -n (whoami)
    set_color 60697B; echo -n ' '(pwd | string replace "/home/ari" "~")' '
    if [ "$git_branch" != "" ]
        set_color C9B091; echo -n 'git'
        set_color CAD89A; echo -n ':('
        set_color C9B091; echo -n $git_branch
        set_color CAD89A; echo -n ') '
    end
    set_color normal; echo -n '$ '
end
