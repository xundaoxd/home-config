local telescope = require('telescope')
local actions = require('telescope.actions')

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
        fzf = {
            fuzzy = true,                       -- false will only do exact matching
            override_generic_sorter = true,     -- override the generic sorter
            override_file_sorter = true,        -- override the file sorter
            case_mode = "smart_case",           -- or "ignore_case" or "respect_case"
                                                -- the default case_mode is "smart_case"
        },
    }
})
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('v', '<leader>fg', builtin.grep_string)
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>ft', builtin.tags)

