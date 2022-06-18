-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.julials.setup{}
        end
    }
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/cmp-nvim-lsp'},
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
    }

    use {
        'nvim-telescope/telescope.nvim',
        opt = false,
        requires = {{'nvim-lua/plenary.nvim', opt = false}}
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup{
                icons = false,
                fold_open = "v", -- icon used for open folds
                fold_closed = ">", -- icon used for closed folds
                indent_lines = false, -- add an indent guide below the fold icons
                signs = {
                    -- icons / text used for a diagnostic
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info"
                },
                use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
            }
        end
    }
    use 'kdheepak/JuliaFormatter.vim'
    use 'JuliaEditorSupport/julia-vim'
    use 'psliwka/vim-smoothie'
    use 'jpalardy/vim-slime'
    use 'morhetz/gruvbox'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false },
        config = function()
            require('lualine').setup {
                options = { theme = 'gruvbox_dark' }
            }
        end
    }
    use 'itchyny/vim-cursorword'
    use 'tmhedberg/SimpylFold'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'airblade/vim-gitgutter'
    use 'Yggdroot/indentLine'
    use 'lervag/vimtex'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {{'nvim-lua/plenary.nvim', opt = false}},
        config = function()
            local null = require("null-ls")
            null.setup({
                sources = {
                    require("null-ls").builtins.diagnostics.vale,
                },
            })
        end
    }
end)
