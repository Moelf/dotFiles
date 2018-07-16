set number 
set ruler
syntax enable
filetype plugin indent on
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
set ignorecase
set hlsearch
set incsearch
set showmatch

set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set wrap
imap kj <Esc>

let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"vim-root syntax
Plug 'parnmatt/vim-root'

"commentary
Plug 'tpope/vim-commentary'

"powerline
Plug 'itchyny/lightline.vim'
set noshowmode  "Because we have powerline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"DeoComplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10
let g:vimtex_indent_enabled = 1

"C++ completion
"Plug 'zchee/deoplete-clang'
"let g:deoplete#sources#clang#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
"let g:deoplete#sources#clang#clang_header ='/usr/lib/clang'

"Surrouding quotes
Plug 'tpope/vim-surround'
"VimTex
Plug 'lervag/vimtex'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='xelatex'
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_complete_close_braces = 0
" Initialize plugin system
call plug#end()
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif
