return {
    'morhetz/gruvbox',
    event = 'VimEnter',
    init = function()
        vim.cmd([[colorscheme gruvbox]])
    end,
}
