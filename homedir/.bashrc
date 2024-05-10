# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export JULIA_NUM_THREADS=8
alias vim='nvim -O'
export EDITOR=vim
export TERM=xterm-256color

HISTSIZE=1000000
HISTFILESIZE=2000000
