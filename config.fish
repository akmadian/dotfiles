set -Ua fish_user_paths $HOME/repos/cse374-21wi-monorepo/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -x GPG_TTY $TTY
set -x TMPDIR "/tmp"

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
alias unpacktargz="tar xvzf"

function fish_prompt
    set_color normal
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
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
    echo -n '{'
    echo -n "$git_branch"
    echo -n '}'
    set_color red
    echo -n ']'
    set_color normal
    echo -n '$ '
end
