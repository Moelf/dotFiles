call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
"
Plug 'morhetz/gruvbox'
"powerline
Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode  "Because we have powerline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
"rainbow paren
Plug 'kien/rainbow_parentheses.vim'
"golden-ratio
Plug 'roman/golden-ratio'
"vim-rooc syntax
Plug 'parnmatt/vim-root'
"python-folding
Plug 'tmhedberg/SimpylFold'
"Commentary
Plug 'tpope/vim-commentary'
"Surrouding quotes
Plug 'tpope/vim-surround'
"git-gitter
Plug 'airblade/vim-gitgutter'
"IndentLine
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_term = 244
let g:indentLine_concealcursor="cv"

"ale
Plug 'w0rp/ale'
"NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"Language Server
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.local/bin/pyls'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
set completefunc=LanguageClient#complete
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
let g:LanguageClient_diagnosticsEnable=0
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"Vim LaTeX
Plug 'lervag/vimtex'
let g:vimtex_compiler_progname = 'nvr'
"Julia
Plug 'JuliaEditorSupport/julia-vim'
" Initialize plugin system
call plug#end()

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
set foldlevel=9
set pastetoggle=<F2>
set expandtab
set updatetime=100
set smarttab
set shiftwidth=4
set tabstop=4
set nowrap
set clipboard+=unnamedplus
set termguicolors
syntax enable
filetype plugin indent on
"terminal enviroment
set shell=/bin/zsh
"escape alternative
tnoremap kj <C-\><C-n>
inoremap kj <Esc>`^
inoremap <Esc> USE kj
"open file under cursor in v split
nnoremap gf <C-W>vgf
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <C-M> :set invnumber \| IndentLinesToggle <CR>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" set a directory to store the undo history
set undofile
set undodir=~/.vimundo/
let mapleader=";"
colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None
