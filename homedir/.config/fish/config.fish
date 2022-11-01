set fish_greeting
set -x JULIA_NUM_THREADS 4
set -x BAT_THEME    gruvbox-dark
set -x EDITOR       "nvim -O"
set -x NNN_PLUG     'p:preview-tui'
set -x NNN_FIFO     /tmp/nnn.fifo
set -x NNN_TRASH    1
set PATH $PATH /home/akako/.local/bin

# User configuration
alias rm "echo 'Use trash'"
alias del trash
alias vim "nvim -O"
alias vimdiff "nvim -d"
alias root "root -l"
alias python python3

function n --wraps=nnn
    nnn -edH
end

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

theme_gruvbox dark hard
if status is-login 
    and test "$XDG_CURRENT_DESKTOP" != "GNOME"
    sway
end

function con
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
