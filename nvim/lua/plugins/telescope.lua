local telescope = require('telescope')
local actions = require('telescope.actions')
local lga_actions = require('telescope-live-grep-args.actions')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.preview_scrolling_down,
                ['<C-k>'] = actions.preview_scrolling_up,
            },
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ['<C-l>'] = lga_actions.quote_prompt(),
                }
            }
        },
        ['ui-select'] = {
            require('telescope.themes').get_dropdown()
        }
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>ft', builtin.tags)

