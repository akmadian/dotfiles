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
alias nvim="~/Downloads/nvim.appimage"

function fish_prompt
    set_color normal
    set git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    if [ git_branch = "" ]
        set gb "test"
    else
        set gb ' {'$git_branch'}'
    end
  
    tput bold
    set_color red
    echo -n '['
    set_color yellow
    echo -n (whoami)
    set_color green
    echo -n '@'
    set_color blue
    echo -n (hostname)
    set_color purple
    echo -n ' '(prompt_pwd)
    set_color normal
    echo -n $gb
    set_color red
    echo -n ']'
    set_color normal
    echo -n '$ '
    tput sgr0
end

