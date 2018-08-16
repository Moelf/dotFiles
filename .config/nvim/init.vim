set number 
set autoindent
set smartindent
set wrap
set ruler
set ignorecase
set hlsearch
set incsearch
set showmatch
set foldmethod=syntax
set foldlevel=99
set nohls
set pastetoggle=<F2>
set expandtab
set updatetime=100
set smarttab
set shiftwidth=4
set tabstop=4
syntax enable
filetype plugin indent on
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
"terminal enviroment
set shell=/bin/zsh
"escape alternative
tnoremap kj <C-\><C-n>
inoremap kj <Esc>`^
inoremap <Esc> USE kj
"open file under cursor in v split
nnoremap gf <C-W>vgf
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" set a directory to store the undo history
set undofile
set undodir=~/.vimundo/

let mapleader=";"
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"rainbow paren
Plug 'kien/rainbow_parentheses.vim'
"golden-ratio
Plug 'roman/golden-ratio'
"vim-rooc syntax
Plug 'parnmatt/vim-root'
"python-folding
Plug 'tmhedberg/SimpylFold'

"powerline
Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode  "Because we have powerline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
"Commentary
Plug 'tpope/vim-commentary'
"Surrouding quotes
Plug 'tpope/vim-surround'

"ale
Plug 'w0rp/ale'

"deoplete
Plug 'Shougo/echodoc.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
autocmd CompleteDone * silent! pclose
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'
set completeopt+=noinsert
set completeopt-=preview
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr> kj pumvisible() ? "<C-e><Esc>" : "<Esc>"
highlight Pmenu ctermbg=4 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"git-gitter
Plug 'airblade/vim-gitgutter'
" Initialize plugin system
call plug#end()
