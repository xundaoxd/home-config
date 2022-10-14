require('telescope').setup({
    extensions = {
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
vim.keymap.set('n', '<leader>ft', builtin.tags)
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols)

vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls)
vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls)

