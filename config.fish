set -Ua fish_user_paths $HOME/repos/cse374-21wi-monorepo/scripts
set -Ua fish_user_paths $HOME/.local/bin
set -x GPG_TTY $TTY

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

