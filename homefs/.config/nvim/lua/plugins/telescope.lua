return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'folke/todo-comments.nvim',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<CR>'] = actions.select_default,
                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<A-j>'] = actions.preview_scrolling_down,
                        ['<A-k>'] = actions.preview_scrolling_up,
                        ['<A-h>'] = actions.preview_scrolling_left,
                        ['<A-l>'] = actions.preview_scrolling_right,
                    },
                    n = {
                        ['<CR>'] = actions.select_default,
                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<A-j>'] = actions.preview_scrolling_down,
                        ['<A-k>'] = actions.preview_scrolling_up,
                        ['<A-h>'] = actions.preview_scrolling_left,
                        ['<A-l>'] = actions.preview_scrolling_right,

                        ['gg'] = actions.move_to_top,
                        ['G'] = actions.move_to_bottom,
                    }
                }
            }
        })
        require('todo-comments').setup({})
    end,
    keys = {
        { '<leader>dh', '<cmd>DiffviewFileHistory<cr>' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>' },
        { '<leader>fs', '<cmd>Telescope help_tags<cr>' },

        { '<leader>ft', '<cmd>TodoTelescope keywords=TODO,FIX,HACK,WARNING<CR>' },
    },
}
