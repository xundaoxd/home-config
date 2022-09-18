local opt = {silent = true, remap = false}

for i=1,9,1 do
    vim.keymap.set('n', '<leader>'..i, ':b'..i..'<CR>', opt)
end

vim.tbl_map(function(i)
    vim.keymap.set('n', '<leader>w'..i, '<C-W>'..i, opt)
end, {'h', 'j', 'k', 'l'})
vim.keymap.set('i', '<C-H>', '<Left>', opt)
vim.keymap.set('i', '<C-J>', '<Down>', opt)
vim.keymap.set('i', '<C-K>', '<Up>', opt)
vim.keymap.set('i', '<C-L>', '<Right>', opt)

vim.keymap.set('n', '<leader>sp', ':sp<CR>', opt)
vim.keymap.set('n', '<leader>vs', ':vs<CR>', opt)

vim.keymap.set({'n', 'v'}, 'H', '^', opt)
vim.keymap.set({'n', 'v'}, 'L', '$', opt)

vim.keymap.set('n', '<leader>qa', ':wqa<CR>', opt)
vim.keymap.set('n', '<leader>qq', ':q<CR>', opt)

vim.keymap.set('', '<up>', '<nop>', opt)
vim.keymap.set('', '<down>', '<nop>', opt)
vim.keymap.set('', '<left>', '<nop>', opt)
vim.keymap.set('', '<right>', '<nop>', opt)
