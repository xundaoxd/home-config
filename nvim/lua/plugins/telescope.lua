require('telescope').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>ft', builtin.tags)
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols)

vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls)
vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls)

