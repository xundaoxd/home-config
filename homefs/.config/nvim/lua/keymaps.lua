-- window
vim.keymap.set({'n', 'v'}, '<C-h>', '<C-w>h')
vim.keymap.set({'n', 'v'}, '<C-j>', '<C-w>j')
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-w>k')
vim.keymap.set({'n', 'v'}, '<C-l>', '<C-w>l')

vim.keymap.set({'n', 'v'}, 'sp', '<C-w>s')
vim.keymap.set({'n', 'v'}, 'vs', '<C-w>v')

-- move
vim.keymap.set('i', '<C-h>', '<left>')
vim.keymap.set('i', '<C-j>', '<down>')
vim.keymap.set('i', '<C-k>', '<up>')
vim.keymap.set('i', '<C-l>', '<right>')

vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, 'L', '$')
vim.keymap.set({'n', 'v'}, 'J', '10j')
vim.keymap.set({'n', 'v'}, 'K', '10k')
vim.keymap.set({'n', 'v'}, 'W', 'b')
vim.keymap.set({'n', 'v'}, 'E', 'ge')

-- copy, cut, delete
vim.keymap.set('v', '<leader>x', '"+x')
vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>dd', '"+dd')
vim.keymap.set('n', '<leader>dw', '"+dw')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>yw', 'viw"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

vim.keymap.set('n', 'dL', 'd$')
vim.keymap.set('n', 'dH', 'd0')

-- exit
vim.keymap.set({'n', 'v'}, '<C-s>', '<cmd>w<CR>')
vim.keymap.set({'n', 'v'}, '<leader>qq', '<cmd>wqa!<CR>')
vim.keymap.set({'n', 'v'}, '<leader>qa', '<cmd>qa!<CR>')
vim.keymap.set({'n', 'v'}, '<leader>qw', '<cmd>q!<CR>')

-- misc
vim.keymap.set({'n', 'v', 'i'}, '<up>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<down>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<left>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<right>', '<nop>')

