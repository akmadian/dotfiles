set -Ua fish_user_paths $HOME/repos/cse374-21wi-monorepo/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -x GPG_TTY $TTY
set -x TMPDIR "/tmp"

set fish_color_command white

alias gs="git status"
alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"
alias ai="sudo apt install"
alias agi="sudo apt-get install"
alias xcs="xclip -selection c"
alias cls="clear"
alias ll="ls -alF"
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../../"
alias cdd="cd ~/Downloads"
alias unpacktargz="tar xvzf"
alias ssn="sudo shutdown now"
alias sleep="systemctl suspend"

function fish_prompt
    set_color normal
    set git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    if [ git_branch = "" ]
        set gb "test"
    else
        set gb $git_branch
    end
    set_color C9B091
    echo -n (whoami)
    set_color A6A780
    echo -n '@'
    set_color D3A080
    echo -n (hostname)
    set_color B1B666
    echo -n ' '(prompt_pwd)
    set_color A45479
    echo -n ' git'
    set_color CAD89A
    echo -n ':['
    set_color A45479
    echo -n $gb
    set_color CAD89A
    echo -n '] '
    set_color normal
    echo -n '~ '
end

