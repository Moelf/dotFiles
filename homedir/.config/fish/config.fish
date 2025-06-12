set fish_greeting
set PATH $PATH $HOME/.local/bin
set PATH $PATH /usr/bin/vendor_perl/

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

function con
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end

export (envsubst < $HOME/.config/environment.d/main.conf)
if status --is-interactive
    atuin init fish --disable-up-arrow | source
    theme_gruvbox dark
end

function mget --wraps=mega-get
    if count $argv > /dev/null
        set -l stripped (string replace -ar '\s' '' $argv[1])
        echo $stripped
        mega-get $stripped . -q
    end
end
fish_add_path /Users/akako/.pixi/bin
