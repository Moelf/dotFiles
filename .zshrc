# If you come from bash you might have to change your $PATH.
export TERM=xterm-256color 
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH:/home/akako/Documents/github/flutter_linux/flutter/bin:/home/akako/Documents/AWAKE

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster-cus"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh background_jobs time)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
export JULIA_NUM_THREADS=4

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_FIND_NO_DUPS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
  gitfast
  git
  sudo
  python
  autojump 
  pip
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=nvim\ -O
alias vimdiff=nvim\ -d
export EDITOR='nvim -O'
alias zshrc=vim\ ~/.zshrc
alias root=root\ -l
alias python=python3
alias du=ncdu
alias ll=ls\ -alFh
alias uaf10=ssh\ -q\ -Y\ jling@uaf-10.t2.ucsd.edu\ -t\ zsh
alias tau=ssh\ -Y\ jling@tau.physics.ucsb.edu\ -t\ zsh
alias ex=ssh\ -Y\ ex@blog.jling.dev\ -t\ zsh
alias matrix=ssh\ ex@matrix.jling.dev
alias start_gnome=XDG_SESSION_TYPE=wayland\ dbus-run-session\ gnome-session
alias here=xdg-open\ .
alias rimecon=cd\ ~/.config/ibus/rime
alias vm=ssh\ jiling@cwe-513-vol555\ -L\ 8889:localhost:8889
alias icat="kitty +kitten icat"
alias ci=sh\ ~/imgcat.sh
youtube(){
    mpv --gpu-context=wayland --hwdec=auto --ytdl-format="bestvideo[height<=?2160]+bestaudio/best" "$@"
}

if [ -n "$WAYLAND_DISPLAY" ]; then
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
        eval `ssh-agent`
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
fi
source /usr/share/fzf/key-bindings.zsh
