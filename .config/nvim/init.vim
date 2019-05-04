function CP()
    if &buftype=="terminal"
        bd!
    endif
endfunction

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1


"jedi vim
Plug 'deoplete-plugins/deoplete-jedi'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Make sure you use single quotes
Plug 'morhetz/gruvbox'
"powerline
Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode  "Because we have powerline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
"NerdTree
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"rainbow paren
Plug 'kien/rainbow_parentheses.vim'
"golden-ratio
Plug 'roman/golden-ratio'
"To make NerdTree look better
"cursor-word
Plug 'itchyny/vim-cursorword'
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
"Vimwiki
Plug 'vimwiki/vimwiki'
"IndentLine
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_term = 244
let g:indentLine_fileTypeExclude=['tex','txt']
let g:indentLine_concealcursor="cv"

"ale
Plug 'w0rp/ale'
let b:ale_fixers = ['autopep8']

"Julia
Plug 'JuliaEditorSupport/julia-vim'
let g:default_julia_version = '1.1'
let g:LanguageClient_autoStart = 0

"Vim LaTeX
Plug 'lervag/vimtex'
let g:tex_conceal = "amgs"
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
" Initialize plugin system
call plug#end()
call vimtex#imaps#add_map({
            \ 'lhs' : '<m-b>',
            \ 'rhs' : '\begin{',
            \ 'leader'  : '',
            \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
            \})
set number 
set autoindent
set smartindent
set nowrap
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
"open file under cursor in v split
nnoremap gf <C-W>vgf
" autocmd FileType python nnoremap <buffer> <C-p> :w<CR>:exec '!python' shellescape(@%,1)<CR>
set splitright
nnoremap <C-p> :call CP() <CR>
autocmd FileType python nnoremap <buffer> <C-p> :w<CR>:vsp<CR>:term python %<CR>A
autocmd FileType julia  nnoremap <buffer> <C-p> :w<CR>:vsp<CR>:term julia %<CR>A
autocmd FileType cpp  nnoremap <buffer> <C-p> :w<CR>:vsp<CR>:term root -l %<CR>A
autocmd FileType python nnoremap <buffer> <C-f> :ALEFix<CR>:w<CR>
nnoremap <C-M> :set invnumber \| IndentLinesToggle <CR>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:golden_ratio_exclude_nonmodifiable = 1

" set a directory to store the undo history
set undofile
set undodir=~/.vimundo/
let mapleader=";"
colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None
" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif
