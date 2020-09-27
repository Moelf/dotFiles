# export TERM=xterm-256color 

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export JULIA_NUM_THREADS=6
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

HIST_FIND_NO_DUPS="true"

plugins=(
#  zsh-autosuggestions
#  gitfast
#  git
#  sudo
#  python
#  autojump 
#  pip
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vim=nvim\ -O
alias vimdiff=nvim\ -d
export EDITOR='nvim -O'
alias zshrc=vim\ ~/.zshrc
alias root=root\ -l
alias python=python3
alias ll=ls\ -alFh
alias icat="kitty +kitten icat"
alias ci=sh\ ~/imgcat.sh
if [ -n "$WAYLAND_DISPLAY" ]; then
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
        eval `ssh-agent`
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.fzf/shell/key-bindings.zsh
