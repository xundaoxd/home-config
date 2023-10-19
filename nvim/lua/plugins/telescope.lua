local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-u>'] = false,
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

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'ft', builtin.tags, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', 'gws', builtin.lsp_workspace_symbols, {})

