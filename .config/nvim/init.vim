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
"NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
"Julia
Plug 'JuliaEditorSupport/julia-vim'
let g:default_julia_version = '0.6'
let g:LanguageClient_autoStart = 1
" enable ncm2 for all buffers
au User Ncm2Plugin call ncm2#register_source({                                
            \ 'name' : 'vimtex',                                                      
            \ 'priority': 9,                                                          
            \ 'subscope_enable': 1,                                                   
            \ 'complete_length': 1,                                                   
            \ 'scope': ['tex'],                                                       
            \ 'mark': 'tex',                                                          
            \ 'word_pattern': '\w+',                                                  
            \ 'complete_pattern': g:vimtex#re#ncm,                                    
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],   
            \ })         
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
    \ 'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
    \     using LanguageServer;
    \     server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
    \     server.runlinter = true;
    \     run(server);
    \ '],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
set completefunc=LanguageClient#complete
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
let g:LanguageClient_diagnosticsEnable=0
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"Vim LaTeX
Plug 'lervag/vimtex'
let g:tex_conceal = "amgs"
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
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
inoremap <Esc> USE kj
"open file under cursor in v split
nnoremap gf <C-W>vgf
nnoremap P :pu<CR>
autocmd FileType python nnoremap <buffer> <C-p> :w<CR>:exec '!python' shellescape(@%,1)<CR>
autocmd FileType julia  nnoremap <buffer> <C-p> :w<CR>:exec '!julia' shellescape(@%,1)<CR>
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
