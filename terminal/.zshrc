neofetch | lolcat

# TMUX
# start if not started
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u
fi

precmd () {
    tmux refresh-client -S # Update tmux status bar working directory
}

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Themes: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Favorites: amuse, crunch, linuxonly
ZSH_THEME="custom"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias pacin="sudo pacman -S"
alias panins="sudo pacman -U"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fgui='nautilus .'
alias cls='clear'
alias um='umount'
alias g='git'
alias gc='git c'
alias gp='git push'

# Function Aliases
alias ao='audio-out'
alias nm='nas-mount'

nas-mount() {
  sudo mkdir -p ~/descartes/$1
  sudo mount 192.168.0.6:/nfs/$1 ~/descartes/$1
}

PATH="$HOME/.local/bin:$PATH"
