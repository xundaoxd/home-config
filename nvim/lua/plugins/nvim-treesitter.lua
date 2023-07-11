require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'cmake', 'make', 'ninja',
        'c', 'cpp', 'cuda', 'markdown', 'python', 'lua', 'bash', 'dot', 'javascript', 'java',
        'llvm', 'mlir', 'vim', 'dockerfile', 'gitignore', 'json', 'markdown', 'markdown_inline',
    },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
})

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]])

