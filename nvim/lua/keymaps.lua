local utils = require('utils')
local opt = {silent = true, remap = false}

for i=1,9,1 do
    vim.keymap.set('n', '<leader>'..i, function() utils.switch_buf(i) end)
end

vim.tbl_map(function(i)
    vim.keymap.set('n', '<leader>w'..i, '<C-w>'..i, opt)
end, {'h', 'j', 'k', 'l'})

vim.keymap.set('n', '<leader>sp', ':sp<CR>', opt)
vim.keymap.set('n', '<leader>vs', ':vs<CR>', opt)

vim.keymap.set('i', '<C-h>', '<left>', opt)
vim.keymap.set('i', '<C-j>', '<down>', opt)
vim.keymap.set('i', '<C-k>', '<up>', opt)
vim.keymap.set('i', '<C-l>', '<right>', opt)

vim.keymap.set('v', '<leader>x', '"+x', opt)
vim.keymap.set('v', '<leader>d', '"+d', opt)
vim.keymap.set('n', '<leader>dd', '"+dd', opt)
vim.keymap.set('n', '<leader>dw', '"+dw', opt)
vim.keymap.set('v', '<leader>y', '"+y', opt)
vim.keymap.set('n', '<leader>yy', '"+yy', opt)
vim.keymap.set('n', '<leader>yw', 'viw"+y', opt)

vim.keymap.set({'n', 'v'}, 'H', '^', opt)
vim.keymap.set({'n', 'v'}, 'L', '$', opt)
vim.keymap.set({'n', 'v'}, 'J', '10j', opt)
vim.keymap.set({'n', 'v'}, 'K', '10k', opt)
vim.keymap.set({'n', 'v'}, 'W', 'b', opt)
vim.keymap.set({'n', 'v'}, 'E', 'ge', opt)

vim.keymap.set({'n', 'v'}, 'dL', 'd$', opt)
vim.keymap.set({'n', 'v'}, 'dH', 'd0', opt)

vim.keymap.set({'n', 'v'}, '<C-s>', ':w<CR>', opt)
vim.keymap.set('n', '<leader>qa', ':wqa!<CR>', opt)
vim.keymap.set('n', '<leader>qq', ':q!<CR>', opt)

vim.keymap.set({'n', 'v', 'i'}, '<up>', '<nop>', opt)
vim.keymap.set({'n', 'v', 'i'}, '<down>', '<nop>', opt)
vim.keymap.set({'n', 'v', 'i'}, '<left>', '<nop>', opt)
vim.keymap.set({'n', 'v', 'i'}, '<right>', '<nop>', opt)

