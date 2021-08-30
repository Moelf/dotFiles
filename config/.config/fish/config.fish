set -x JULIA_NUM_THREADS 4
set -x BAT_THEME gruvbox-dark
set -x EDITOR "nvim -O"
set -x NNN_PLUG 'p:preview-tui'
set -x NNN_FIFO /tmp/nnn.fifo

# User configuration
alias vim "lvim -O"
alias vimdiff "lvim -d"
alias root "root -l"
alias python python3

function n --wraps=nnn
    nnn -edH
end
