-- bootstrap lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require('plugins')
require('nvimoptions')
require('keymaps')

-- we configure all plugin specific options in this file

-- Vim Slime
vim.g.slime_target = 'neovim'
vim.g.lightline = { colorscheme = 'wombat' }
vim.g.indentLine_char = '▏'
vim.g.indentLine_color_term = 244
vim.g.indentLine_fileTypeExclude = { 'tex', 'txt' }
vim.g.indentLine_concealcursor = "cv"

-- Vim LaTeX
vim.g.vimtex_quickfix_mode = 0
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

-- Copilot
vim.g.copilot_no_tab_map = true

-- typst
vim.g.typst_pdf_viewer = 'zathura'

-- notify
vim.notify = require("notify")

-- mason-lspconfig
require("mason-lspconfig").setup {
    automatic_enable = {
        exclude = {
            "julials"
        }
    }
}

vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },

  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
  },

  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>tp", function()
      client:exec_cmd({
        title = "pin",
        command = "tinymist.pinMain",
        arguments = { vim.api.nvim_buf_get_name(bufnr) },
      }, { bufnr = bufnr })
    end, {
      buffer = bufnr,
      desc = "[T]inymist [P]in",
      noremap = true,
    })

    vim.keymap.set("n", "<leader>tu", function()
      client:exec_cmd({
        title = "unpin",
        command = "tinymist.pinMain",
        arguments = { vim.v.null },
      }, { bufnr = bufnr })
    end, {
      buffer = bufnr,
      desc = "[T]inymist [U]npin",
      noremap = true,
    })
  end,
})
