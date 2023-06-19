require('nvim-treesitter.configs').setup({
    ensure_installed = {'cmake', 'c', 'cpp', 'cuda', 'markdown', 'llvm', 'vim', 'lua', 'dockerfile', 'gitignore', 'json'},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
})

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]])

