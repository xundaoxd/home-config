require('nvim-treesitter.configs').setup({
    ensure_installed = {'cmake', 'c', 'cpp', 'cuda', 'markdown', 'llvm', 'vim', 'lua', 'dockerfile', 'gitignore', 'json'},
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 5000
        end
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

