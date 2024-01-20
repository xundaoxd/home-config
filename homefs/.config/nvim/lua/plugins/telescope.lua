local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()

vim.keymap.set('n', 'ff', builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', 'fs', builtin.lsp_workspace_symbols)

-- lsp
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', 'gr', builtin.lsp_references)
