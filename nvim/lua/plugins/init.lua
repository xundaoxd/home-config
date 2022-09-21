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
    use {
        'luochen1990/rainbow',
        config = function() vim.g.rainbow_active = 1 end
    }

    -- coding
    use 'terryma/vim-multiple-cursors'
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
    use { 'hrsh7th/cmp-cmdline', requires = 'nvim-cmp' }
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
    use 'terryma/vim-expand-region'

    -- control
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.diffview') end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'APZelos/blamer.nvim',
        config = function() vim.g.blamer_enabled = 1 end
    }
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

