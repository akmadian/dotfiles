set -Ua fish_user_paths $HOME/repos/cse374-21wi-monorepo/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -x GPG_TTY $TTY
set -x TMPDIR "/tmp"

set fish_color_command white

# Git
alias gs="git status"
alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"

# Package Managers
alias ai="sudo apt install"
alias agi="sudo apt-get install"
alias pi="sudo pacman -S"
alias yi="yay -S"

# General
alias cls="clear"
alias ll="ls -alhF"
alias unpacktargz="tar xvzf"
alias ssn="sudo shutdown now"
alias sleep="systemctl suspend"
alias bl="sudo bl" # Backlight
alias cb="cbonsai -L 50 -s (random)" # For a pretty tree
alias xcs="xclip -selection c"
alias orm="bash orm" # No idea why, but this script really wants to be run with bash

# Navigation
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../../"
alias cdd="cd ~/Downloads"

function fish_prompt
    set_color normal
    set git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    set_color C9B091
    echo -n (whoami)
    set_color A6A780
    echo -n '@'
    set_color D3A080
    echo -n (hostname)
    set_color B1B666
    echo -n ' '(prompt_pwd)' '
    if [ "$git_branch" != "" ]
        set_color A45479
        echo -n 'git'
        set_color CAD89A
        echo -n ':('
        set_color A45479
        echo -n $git_branch
        set_color CAD89A
        echo -n ') '
    end
    set_color normal
    echo -n '-> '
end

