set fish_greeting
set PATH $PATH /home/akako/.local/bin

# User configuration
alias chat "chatblade -s"
alias rm "echo 'Use trash'"
alias del trash
alias vim "nvim -O"
alias vimdiff "nvim -d"
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

function con
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
