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

theme_gruvbox dark hard
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/akako/Documents/github/dotFiles/homedir/.julia/conda/3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
if status is-login
    sway
end
