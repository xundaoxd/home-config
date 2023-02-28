require('telescope').setup({
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
                }
            }
        },
        ['ui-select'] = {
            require('telescope.themes').get_dropdown()
        }
    }
})
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('ui-select')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>ft', builtin.tags)

