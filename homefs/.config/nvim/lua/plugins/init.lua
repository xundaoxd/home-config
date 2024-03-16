local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
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
    use {
        'mhinz/vim-startify',
        event = 'VimEnter',
        config = function() require('plugins.vim-startify') end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine') end
    }
    use {
        'willothy/nvim-cokeline',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function() require('plugins.nvim-cokeline') end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('ibl').setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end
    }
    use {
        'APZelos/blamer.nvim',
        config = function() vim.g.blamer_enabled = 1 end
    }
    use {
        'morhetz/gruvbox',
        event = 'VimEnter',
        config = function() vim.cmd([[colorscheme gruvbox]]) end
    }

    -- coding
    use 'terryma/vim-expand-region'
    use 'tpope/vim-surround'
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- auto cmp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',
            {
                'saadparwaiz1/cmp_luasnip',
                requires = {
                    'L3MON4D3/LuaSnip',
                    'rafamadriz/friendly-snippets',
                    'honza/vim-snippets',
                },
            },
            {
                'hrsh7th/cmp-nvim-lsp',
                requires = {
                    'onsails/lspkind.nvim',
                    'neovim/nvim-lspconfig',
                    'williamboman/mason.nvim',
                    'williamboman/mason-lspconfig.nvim',
                },
            },
        },
        config = function() require('plugins.nvim-cmp') end
    }

    -- misc
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-tree') end
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.diffview') end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {
                'folke/todo-comments.nvim',
                requires = 'nvim-lua/plenary.nvim',
            }
        },
        config = function() require('plugins.telescope') end
    }
    use {
        'easymotion/vim-easymotion',
        config = function() require('plugins.vim-easymotion') end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('plugins.toggleterm') end
    }
    if packer_bootstrap then
        packer.sync()
    end
end)

