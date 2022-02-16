-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        'nvim-telescope/telescope.nvim',
        opt = false,
        requires = {{'nvim-lua/plenary.nvim', opt = false}}
    }
    use 'kdheepak/JuliaFormatter.vim'
    use 'JuliaEditorSupport/julia-vim'
    use 'psliwka/vim-smoothie'
    use 'jpalardy/vim-slime'
    use 'morhetz/gruvbox'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    }
    use 'itchyny/vim-cursorword'
    use 'tmhedberg/SimpylFold'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'airblade/vim-gitgutter'
    use 'Yggdroot/indentLine'
    use 'lervag/vimtex'
end)
