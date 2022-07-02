lua require('plugins')
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


"julia
vnoremap <localleader>jf :JuliaFormatterFormat<CR>
let g:JuliaFormatter_options = {
        \ 'style' : 'blue',
        \ }
let g:JuliaFormatter_use_sysimage=1
let g:latex_to_unicode_auto = 1
let g:slime_target = "neovim"

" Make sure you use single quotes
"powerline
set laststatus=2
set noshowmode  "Because we have powerline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
let g:indentLine_char = '▏'
let g:indentLine_color_term = 244
let g:indentLine_fileTypeExclude=['tex','txt']
let g:indentLine_concealcursor="cv"

"Vim LaTeX
let g:vimtex_view_method = 'zathura'
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
set foldlevel=8
set expandtab
set updatetime=100
set smarttab
set shiftwidth=4
set tabstop=4
set nowrap
set clipboard+=unnamedplus
set termguicolors
filetype plugin indent on
"escape alternative
tnoremap kj <C-\><C-n>
inoremap kj <Esc>`^
" toggle LSP trouble pannel
nnoremap <leader>xx <cmd>TroubleToggle<cr>
" toggle copilot pannel
nnoremap <leader>cc <cmd>Copilot panel<cr>
"open file under cursor in v split
nnoremap gf <C-W>vgf
" autocmd FileType python nnoremap <buffer> <C-p> :w<CR>:exec '!python' shellescape(@%,1)<CR>
set splitright
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
