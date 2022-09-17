local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]
local packer = require('packer')
packer.init({
    package_root = vim.fn.stdpath('config')..'/pack',
    display = {
        open_fn = function()
            return require('packer.util').float()
        end
    }
})

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ui
    use 'mhinz/vim-startify'
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('conf.nvim-tree') end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('conf.lualine') end
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        config = function() require('bufferline').setup() end
    }

    -- cmp
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('conf.nvim-cmp') end
    }
    use { 'hrsh7th/cmp-path', requires = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', requires = 'nvim-cmp' }
    use { 'hrsh7th/cmp-emoji', requires = 'nvim-cmp' }
    use {
        'saadparwaiz1/cmp_luasnip',
        requires = {
            'nvim-cmp',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        }
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        requires = {
            'nvim-cmp',
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        config = function() require('conf.lsp') end
    }

    -- control
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('conf.telescope') end
    }
    use {
        'voldikss/vim-floaterm',
        config = function() require('conf.vim-floaterm') end
    }
    if packer_bootstrap then
        packer.sync()
    end
end)

