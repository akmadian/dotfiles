# Generic PATH append format:
#   set -Ua fish_user_paths [location]

set -Ua fish_user_paths $HOME/cs/CSE-374/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -Ux GPG_TTY (tty)
set -x TMPDIR "/tmp"
set -Ux EDITOR nvim
set -Ux BROWSER brave

set fish_color_command white

# Git
alias gs="git status"
alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"
alias orm="bash orm" # No idea why, but this script really wants to be run with bash

# Package Managers
alias ai="sudo apt install"
alias agi="sudo apt-get install"

alias pi="sudo pacman -S"
alias yi="yay -S"

# General
alias cls="clear"
alias ll="ls -lhAF"
alias unpacktargz="tar xvzf"
alias ssn="sudo shutdown now"
alias sleep="systemctl suspend"
alias bl="sudo bl" # Backlight
alias cb="cbonsai -L 50 -s (random)" # For a pretty tree
alias xcs="xclip -selection c"
alias cleantex="rm *aux *bcf *bbl *blg *fdb_latexmk *fls *lof *log *out *run.xml *synctex.gz *toc"
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"

alias fishconfig='nvim ~/dotfiles/.config/fish/config.fish'
alias nvimconfig='nvim ~/dotfiles/.config/nvim/init.vim'

# Navigation
alias ..="cd .."
alias cdd="cd ~/Downloads"
alias q="exit"
abbr -a -- - 'cd -' # Cause alias - doesn't work

# TUI Apps
alias reddit="tuir --enable-media"
alias email="neomutt"
alias emailpull="mbsync -a"

function fish_prompt
    set_color normal
    set git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')

    set_color C9B091; echo -n (whoami)
    set_color A6A780; echo -n '@'
    set_color D3A080; echo -n (cat /etc/hostname)
    set_color B1B666; echo -n ' '(prompt_pwd)' '
    if [ "$git_branch" != "" ]
        set_color A45479; echo -n 'git'
        set_color CAD89A; echo -n ':('
        set_color A45479; echo -n $git_branch
        set_color CAD89A; echo -n ') '
    end
    set_color normal; echo -n '-> '
end

