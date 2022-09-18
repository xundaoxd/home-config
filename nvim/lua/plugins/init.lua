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
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-tree') end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine') end
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('bufferline').setup() end
    }

    -- coding
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('plugins.nvim-cmp') end
    }
    use { 'hrsh7th/cmp-path', requires = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', requires = 'nvim-cmp' }
    use { 'hrsh7th/cmp-emoji', requires = 'nvim-cmp' }
    use 'hrsh7th/cmp-calc'
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
            'lukas-reineke/lsp-format.nvim',
        },
        config = function() require('plugins.cmp-nvim-lsp') end
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- control
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugins.telescope') end
    }
    use {
        'voldikss/vim-floaterm',
        config = function() require('plugins.vim-floaterm') end
    }
    use 'lewis6991/impatient.nvim'
    if packer_bootstrap then
        packer.sync()
    end
end)

