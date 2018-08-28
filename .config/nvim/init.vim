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
set pastetoggle=<F2>
set expandtab
set updatetime=100
set smarttab
set shiftwidth=4
set tabstop=4
set nowrap
" set termguicolors
syntax enable
filetype plugin indent on
colorscheme slate
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
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
"
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

"ale
Plug 'w0rp/ale'
"deoplete
" Plug 'Shougo/echodoc.vim'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" " complete with words from any opened file
" let g:context_filetype#same_filetypes = {}
" let g:context_filetype#same_filetypes._ = '_'
" assuming your using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
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
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"git-gitter
Plug 'airblade/vim-gitgutter'
"Julia
Plug 'JuliaEditorSupport/julia-vim'
"IndentLine
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_term = 244
" Initialize plugin system
"
call plug#end()
