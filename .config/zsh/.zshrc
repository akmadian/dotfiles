export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$HOME/repos/cse374-21wi-monorepo/scripts:$PATH
export PATH=$HOME/repos/printc-/printc:$PATH
export GPG_TTY=$TTY
export TMPDIR="/tmp"
export TERM=st-256color

# Themes: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Favorites: amuse, crunch, linuxonly
ZSH_THEME=custom

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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
alias ll="ls -alhF"
alias unpacktargz="tar xvzf"
alias ssn="sudo shutdown now"
alias sleep="systemctl suspend"
alias bl="sudo bl" # Backlight
alias cb="cbonsai -L 50 -s (random)" # For a pretty tree
alias xcs="xclip -selection c"

# Navigation
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../../"
alias cdd="cd ~/Downloads"
alias q="exit"

# TUI Apps
alias reddit="tuir --enable-media"
alias email="neomutt"
alias emailpull="mbsync -a"

PATH="$HOME/.local/bin:$PATH"
