local vim = vim
local api = vim.api

require('plugins')
require('nvimoptions')
require('keymaps')

-- we configure all plugin specific options in this file

-- powerline
vim.g.lightline = {colorscheme='wombat'}
vim.g.indentLine_char = '▏'
vim.g.indentLine_color_term = 244
vim.g.indentLine_fileTypeExclude={'tex','txt'}
vim.g.indentLine_concealcursor="cv"

-- Vim LaTeX
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode=0
vim.g.vimtex_compiler_latexmk = { 
    executable = 'latexmk',
    options = {
        '-xelatex',
        '-shell-escape',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
    }
}
