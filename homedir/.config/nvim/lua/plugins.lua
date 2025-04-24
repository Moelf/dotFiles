return require("lazy").setup({
    'roman/golden-ratio',
    'mcchrish/nnn.vim',
    'github/copilot.vim',
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<C-S-p>", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy=false,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.julials.setup{}
            require'lspconfig'.pyright.setup{}
            -- require'lspconfig'.typst_lsp.setup{}
        end
    },
    'williamboman/mason.nvim',
    'echasnovski/mini.icons',
    'folke/which-key.nvim',
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function()
            local nts = require("nvim-treesitter.configs")
            nts.setup {
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "typst",
                    "julia", "llvm", "diff", "markdown", "python",
                },
                highlight = {
                    enable = true,
                },
                disable = function(lang, buf)
                    local max_filesize = 10000 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            }
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noselect",
                },

                -- You must set mapping.
                mapping = {
                    ['<C-g>'] = cmp.mapping(function(fallback)
                        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
                    end),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
                },

                experimental = {
                    ghost_text = false -- this feature conflict with copilot.vim's preview.
                },

                -- You should specify your *installed* sources.
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" }
                },
            })
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {{'nvim-lua/plenary.nvim', lazy = false}}
    },
    'JuliaEditorSupport/julia-vim',
    {
        'psliwka/vim-smoothie',
        lazy = false
    },
    {
        'akinsho/toggleterm.nvim', version = "*",
        config = function()
            require('toggleterm').setup {
                open_mapping = [[<c-t>]],
                direction = 'vertical',
                size = vim.o.columns * 0.4
            }

        end
    },
    'morhetz/gruvbox',
    {
        'nvim-tree/nvim-tree.lua',
        config = true
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = { theme = 'gruvbox_dark' }
            }
        end
    },
    'itchyny/vim-cursorword',
    'tmhedberg/SimpylFold',
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'airblade/vim-gitgutter',
    'Yggdroot/indentLine',
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_general_viewer = 'zathura'
            vim.g.tex_flavor = 'latex'
        end
    },
    {
        'mfussenegger/nvim-lint',
        config = function()
            local null = require("lint")
            null.linters_by_ft = {
                markdown = {'vale',}
            }
        end
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        opts = {
            provider = "ollama",
            ollama = {
                endpoint = "http://desktop:11434", -- Note that there is no /v1 at the end.
                model = "llama3.2",
            },
        },
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    }
})
