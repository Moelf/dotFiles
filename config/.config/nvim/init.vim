call plug#begin('~/.vim/plugged')

"LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" julia
Plug 'kdheepak/JuliaFormatter.vim'
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>
let g:JuliaFormatter_options = {
        \ 'style' : 'blue',
        \ }
let g:JuliaFormatter_use_sysimage=1
let g:JuliaFormatter_always_launch_server=1

Plug 'JuliaEditorSupport/julia-vim'
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
"golden-ratio
Plug 'roman/golden-ratio'
"cursor-word
Plug 'itchyny/vim-cursorword'
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

"Vim LaTeX
Plug 'lervag/vimtex'
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
call plug#end()

lua << EOF
    require'lspconfig'.julials.setup{
        on_new_config = function(new_config,new_root_dir)
          server_path = "/home/akako/.julia/packages/LanguageServer/1LFYN/src/"
          cmd = {
            "julia",
            "--project="..server_path,
            "--startup-file=no",
            "--history-file=no",
            "-e", [[
              using Pkg;
              Pkg.instantiate()
              using LanguageServer; using SymbolServer;
              depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
              project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
              # Make sure that we only load packages from this environment specifically.
              @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
              server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
              server.runlinter = true;
              run(server);
            ]]
        };
          new_config.cmd = cmd
        end
    }
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


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
"escape alternative
tnoremap kj <C-\><C-n>
inoremap kj <Esc>`^
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
