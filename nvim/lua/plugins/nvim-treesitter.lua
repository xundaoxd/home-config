require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'cmake', 'make', 'ninja',
        'c', 'cpp', 'cuda', 'markdown', 'python', 'lua', 'bash', 'dot', 'javascript',
        'llvm', 'mlir', 'vim', 'dockerfile', 'gitignore', 'json'
    },
    highlight = {
        enable = true,
    },
})

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]])

