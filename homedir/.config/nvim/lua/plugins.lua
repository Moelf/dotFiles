return require("lazy").setup({
    'github/copilot.vim',
    {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.julials.setup{}
            require'lspconfig'.pyright.setup{}
        end
    },
    'williamboman/nvim-lsp-installer',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'folke/which-key.nvim',
    'hrsh7th/cmp-cmdline',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({

                completion = {
                    completeopt = "menu,menuone,noselect",
                },

                -- You must set mapping.
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
                },

                -- You should specify your *installed* sources.
                sources = {
                    { name = "nvim_lsp" },
                    { name = 'luasnip' },
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
    'psliwka/vim-smoothie',
    'morhetz/gruvbox',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = false },
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
    'lervag/vimtex',
    {
        'mfussenegger/nvim-lint',
        config = function()
            local null = require("lint")
            null.linters_by_ft = {
                markdown = {'vale',}
            }
        end
    }
})
