function CP()
    if &buftype=="terminal"
        bd!
    endif
endfunction

call plug#begin('~/.vim/plugged')

"LSP
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'JuliaEditorSupport/julia-vim'
" julia
let g:latex_to_unicode_auto = 1

" smooth scroll
Plug 'psliwka/vim-smoothie'

" vim-slime
Plug 'jpalardy/vim-slime'
let g:slime_target = "neovim"

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
" Plug 'w0rp/ale'
" let b:ale_fixers = ['autopep8']

"Vim LaTeX
Plug 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = { 
            \ 'executable' : 'latexmk',
            \ 'options' : [ 
            \   '-xelatex',
            \   '-shell-escape',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
let g:vimtex_quickfix_mode=0
" Initialize plugin system
call plug#end()

" language server
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
    local nvim_lsp = require'nvim_lsp'
    local on_attach_vim = function()
        require'diagnostic'.on_attach()
    end
    nvim_lsp.pyls.setup{on_attach=on_attach_vim}
    nvim_lsp.julials.setup({on_attach=on_attach_vim})
EOF
let g:completion_enable_auto_popup = 1
nnoremap <silent> <leader>lg :lua vim.lsp.util.show_line_diagnostics()<CR>

call vimtex#imaps#add_map({
            \ 'lhs' : '<m-b>',
            \ 'rhs' : '\begin{',
            \ 'leader'  : '',
            \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
            \})
set number 
set autoindent
set smartindent
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
" set termguicolors
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
autocmd FileType python nnoremap <buffer> <C-f> :ALEFix<CR>:w<CR>
autocmd FileType julia nnoremap <buffer> <C-c><C-j> :vs term://julia<CR>
autocmd BufNewFile,BufRead *.jmd set filetype=julia
autocmd BufNewFile,BufRead *.jmd set syntax=markdown
autocmd BufNewFile,BufRead *.jmd setlocal commentstring=<!--%s-->
nnoremap <C-M> :set invnumber \| IndentLinesToggle <CR>
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
