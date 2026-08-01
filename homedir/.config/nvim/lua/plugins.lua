return require("lazy").setup({
    defaults = {
        version = false,
    },
    spec = {
        'psliwka/vim-smoothie',
        {
            'rcarriga/nvim-notify',
            opts = {
                fps = 90,
                timeout = 3000,
                max_width = 60,
                render = "wrapped-default"
            }
        },
        {
            'nvim-focus/focus.nvim',
            config = function()
                require("focus").setup(
                    { ui = { cursorline = true, } }
                )

                -- Let diffview own the layout in its own tab; focus.nvim's golden ratio
                -- squeezes the content panes and stretches the file panel.
                local ignore_filetypes = { 'DiffviewFiles', 'DiffviewFileHistory' }
                local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

                -- focus drops these to 1 globally whenever it bails out, and never restores
                -- them, breaking vim's own minimum-width handling for the rest of the session
                local winwidth, winminwidth = vim.o.winwidth, vim.o.winminwidth

                local function in_diffview_tab()
                    local ok, lib = pcall(require, 'diffview.lib')
                    return ok and lib.tabpage_to_view(vim.api.nvim_get_current_tabpage()) ~= nil
                end

                local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

                vim.api.nvim_create_autocmd('WinEnter', {
                    group = augroup,
                    callback = function(args)
                        vim.w.focus_disable = in_diffview_tab()
                            or vim.tbl_contains(ignore_buftypes, vim.bo[args.buf].buftype)
                        vim.o.winwidth, vim.o.winminwidth = winwidth, winminwidth
                    end,
                    desc = 'Disable focus autoresize in diffview tabs and special buftypes',
                })

                vim.api.nvim_create_autocmd('FileType', {
                    group = augroup,
                    callback = function(args)
                        -- args.buf: diffview sets 'filetype' on a buffer that is not current
                        vim.b[args.buf].focus_disable =
                            vim.tbl_contains(ignore_filetypes, vim.bo[args.buf].filetype)
                    end,
                    desc = 'Disable focus autoresize for diffview panels',
                })

                -- tag the windows before focus gets a WinEnter to react to, and undo
                -- whatever it managed to resize already
                vim.api.nvim_create_autocmd('User', {
                    group = augroup,
                    pattern = { 'DiffviewViewOpened', 'DiffviewViewPostLayout', 'DiffviewViewEnter' },
                    callback = function()
                        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                            vim.w[win].focus_disable = true
                        end
                        vim.cmd('wincmd =')
                    end,
                    desc = 'Hand the diffview tab layout back to diffview',
                })

                vim.api.nvim_create_autocmd('VimResized', {
                    group = augroup,
                    callback = function()
                        if in_diffview_tab() then
                            vim.cmd('wincmd =')
                        end
                    end,
                    desc = 'Rebalance diffview panes on terminal resize',
                })
            end
        },
        'github/copilot.vim',
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            keys = {
                { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
            },
        },
        {
            'kaarmu/typst.vim',
            ft = 'typst',
            lazy = false,
        },
        {
            "sindrets/diffview.nvim",
            opts = {
                use_icons = false,
            },
        },
        {
            'chomosuke/typst-preview.nvim',
            ft = 'typst',
            version = '1.*',
            opts = {},
        },
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
        },
        {
            'mrcjkb/rustaceanvim',
            version = '^6', -- Recommended
            lazy = false,   -- This plugin is already lazy
        },
        {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "VeryLazy", -- Or `LspAttach`
            priority = 1000,    -- needs to be loaded in first
            config = function()
                require('tiny-inline-diagnostic').setup()
                vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
            end
        },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "ruff", "ty", "lua_ls", "harper_ls", "tinymist" },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        },
        'echasnovski/mini.icons',
        'folke/which-key.nvim',
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            build = ":TSUpdate",
            config = function()
                local nts = require("nvim-treesitter")
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
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
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
                            vim.api.nvim_feedkeys(
                                vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes(
                                    '<Tab>', true, true, true)), 'n',
                                true)
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
            dependencies = { { 'nvim-lua/plenary.nvim', lazy = false } }
        },
        'JuliaEditorSupport/julia-vim',
        {
            'stevearc/conform.nvim',
            opts = {},
            config = function()
                require("conform").setup({
                    formatters = {
                        runic = {
                            command = "julia",
                            args = { "--startup-file=no", "--project=@runic", "-e", "using Runic; exit(Runic.main(ARGS))" },
                        },
                    },
                    formatters_by_ft = {
                        julia = { 'runic' },
                        python = { "ruff" },
                        typst = { "typstyle" },
                    },
                    default_format_opts = {
                        lsp_format = "fallback",
                    },
                })
            end
        },
        {
            'akinsho/toggleterm.nvim',
            version = "*",
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
                    markdown = { 'vale', }
                }
            end
        },
        {
            "yetone/avante.nvim",
            event = "VeryLazy",
            lazy = false,
            opts = {
                provider = "openai",
                providers = {
                    openai = {
                        endpoint = "http://desktop:4000/",
                        model = "Gemma4",
                        timeout = 30000,
                    },
                },
                behaviour = {
                    auto_suggestions = false,
                }
            },
            build = "make",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "stevearc/dressing.nvim",
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
            }
        }
    }
})
