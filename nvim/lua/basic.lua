vim.g.mapleader = ' '

local options = {
    number = true,
    relativenumber = true,
    cursorline = true,
    cursorcolumn = true,
    list = true,
    listchars = 'tab:>-,trail:-',
    wrap = false,
    showcmd = true,
    scrolloff = 16,
    timeoutlen = 500,
    tags = '.ctags',

    mouse = 'a',

    shiftwidth = 4,
    tabstop = 4,
    smarttab = true,
    expandtab = true,

    swapfile = false,
    autoread = true,
    autowrite = true
}

for k, v in pairs(options) do
    vim.o[k] = v
end

local colorscheme = 'gruvbox'
local _, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

vim.api.nvim_create_user_command("GenTags", function() vim.fn.system({'ctags', '-R', '-o', '.ctags'}) end, {})

