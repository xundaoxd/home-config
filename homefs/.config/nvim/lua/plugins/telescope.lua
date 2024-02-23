local telescope = require('telescope')
local builtin = require('telescope.builtin')
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

vim.keymap.set('n', 'ff', builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', 'fs', builtin.lsp_workspace_symbols)

-- lsp
vim.keymap.set('n', 'fd', builtin.lsp_definitions)
vim.keymap.set('n', 'fi', builtin.lsp_implementations)
vim.keymap.set('n', 'fr', builtin.lsp_references)
