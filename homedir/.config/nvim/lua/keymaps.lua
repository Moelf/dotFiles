-- nvim keymap
vim.keymap.set("i", "kj", "<Esc>", {noremap=true})
vim.keymap.set('n', "<C-M>", function() vim.o.number = not vim.o.number end)

local WhichKey = require("which-key")
local tl = require("telescope.builtin")
WhichKey.register({
    f = {
        name = "Telescope",
        f = {tl.find_files, "Find Files", noremap=true},
        g = {tl.live_grep, "Live RipGrep", noremap=true},
    }
}, {prefix="<leader>"})

WhichKey.register({
    l = {
        name = "LaTeX commands",
        i = {"<cmd>VimtexInfo<CR>", "show latex info", noremap=true},
        I = {"<cmd>VimtexInfoFull<CR>", "show full latex info", noremap=true},
        t = {"<cmd>VimtexTocOpen<CR>", "open latex table of contents", noremap=true},
        T = {"<cmd>VimtexTocToggle<CR>", "toggle latex table of contents", noremap=true},
        q = {"<cmd>VimtexLog<CR>", "show latex compiler log", noremap=true},
        v = {"<cmd>VimtexView<CR>", "view latex output", noremap=true},
        l = {"<cmd>VimtexCompile<CR>", "start latex compilation", noremap=true},
        L = {"<cmd>VimtexCompileSelected<CR>", "start latex compilation for selection", noremap=true},
        k = {"<cmd>VimtexStop<CR>", "stop latex compilation", noremap=true},
        K = {"<cmd>VimtexStopAll<CR>", "stop all latex compilation", noremap=true},
        e = {"<cmd>VimtexErrors<CR>", "show latex compilation errors", noremap=true},
        o = {"<cmd>VimtexCompileOutput<CR>", "open file where compiler is redirected", noremap=true},
        g = {"<cmd>VimtexStatus<CR>", "show latex compiler status", noremap=true},
        G = {"<cmd>VimtexStatusAll<CR>", "show latex compiler status for all", noremap=true},
        c = {"<cmd>VimtexClean<CR>", "clean latex output", noremap=true},
        C = {"<cmd>VimtexCleanAll<CR>", "clean all latex output", noremap=true},
        x = {"<cmd>VimtexReload<CR>", "reload vimtex", noremap=true},
        a = {"<cmd>VimtexContextMenu<CR>", "open latex context menu", noremap=true},
        u = {":call LaTeXtoUnicode#Toggle()<CR>", "toggle latex-to-unicode", noremap=true},
    }
}, {prefix="<leader>"})


WhichKey.register({
    c = {
        name = "LSP/Copilot commands",
        p = {"<cmd>TroubleToggle<CR>", "Show LSP trouble panel", noremap=true},
        c = {"<cmd>Copilot panel<CR>", "Show Copilot panel", noremap=true},
    }
}, {prefix="<leader>"})
