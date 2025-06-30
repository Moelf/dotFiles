-- nvim keymap
vim.keymap.set("i", "kj", "<Esc>", {noremap=true})
vim.keymap.set('n', "<C-M>", function() vim.o.number = not vim.o.number end)

vim.cmd[[
    imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
]]

-- Yes, we're just executing a bunch of Vimscript, but this is the officially
-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
-- vim.cmd[[
-- " Use Tab to expand and jump through snippets
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
-- smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

-- " Use Shift-Tab to jump backwards through snippets
-- imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- ]]

local WhichKey = require("which-key")
local tl = require("telescope.builtin")
WhichKey.add(
  {
    { "<leader>t", group = "nvim.tree" },
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Tree", remap = false },
  }
  )


WhichKey.add(  {
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", tl.find_files, desc = "Find Files", remap = false },
    { "<leader>fg", tl.live_grep, desc = "Live RipGrep", remap = false },
  }
  )

WhichKey.add(
  {
    { "<leader>l", group = "LaTeX commands" },
    { "<leader>lC", "<cmd>VimtexCleanAll<CR>", desc = "clean all latex output", remap = false },
    { "<leader>lG", "<cmd>VimtexStatusAll<CR>", desc = "show latex compiler status for all", remap = false },
    { "<leader>lI", "<cmd>VimtexInfoFull<CR>", desc = "show full latex info", remap = false },
    { "<leader>lK", "<cmd>VimtexStopAll<CR>", desc = "stop all latex compilation", remap = false },
    { "<leader>lL", "<cmd>VimtexCompileSelected<CR>", desc = "start latex compilation for selection", remap = false },
    { "<leader>lT", "<cmd>VimtexTocToggle<CR>", desc = "toggle latex table of contents", remap = false },
    { "<leader>la", "<cmd>VimtexContextMenu<CR>", desc = "open latex context menu", remap = false },
    { "<leader>lc", "<cmd>VimtexClean<CR>", desc = "clean latex output", remap = false },
    { "<leader>le", "<cmd>VimtexErrors<CR>", desc = "show latex compilation errors", remap = false },
    { "<leader>lg", "<cmd>VimtexStatus<CR>", desc = "show latex compiler status", remap = false },
    { "<leader>li", "<cmd>VimtexInfo<CR>", desc = "show latex info", remap = false },
    { "<leader>lk", "<cmd>VimtexStop<CR>", desc = "stop latex compilation", remap = false },
    { "<leader>ll", "<cmd>VimtexCompile<CR>", desc = "start latex compilation", remap = false },
    { "<leader>lo", "<cmd>VimtexCompileOutput<CR>", desc = "open file where compiler is redirected", remap = false },
    { "<leader>lq", "<cmd>VimtexLog<CR>", desc = "show latex compiler log", remap = false },
    { "<leader>lt", "<cmd>VimtexTocOpen<CR>", desc = "open latex table of contents", remap = false },
    { "<leader>lu", ":call LaTeXtoUnicode#Toggle()<CR>", desc = "toggle latex-to-unicode", remap = false },
    { "<leader>lv", "<cmd>VimtexView<CR>", desc = "view latex output", remap = false },
    { "<leader>lx", "<cmd>VimtexReload<CR>", desc = "reload vimtex", remap = false },
  }
)

WhichKey.add(
  {
    { "<leader>c", group = "LSP/Copilot commands" },
    { "<leader>cc", "<cmd>Copilot panel<CR>", desc = "Show Copilot panel", remap = false },
    { "<leader>cf", "<cmd>lua require('conform').format({async=true})<CR>", desc = "conform Format", remap = false },
    { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Format", remap = false },
    { "<leader>cp", "<cmd>Trouble diagnostics toggle<CR>", desc = "Show LSP trouble panel", remap = false },
  }
)
