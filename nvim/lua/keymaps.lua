local opt = {silent = true, remap = false}

for i=1,9,1 do
    vim.keymap.set('n', '<leader>'..i, ':b'..i..'<CR>', opt)
end

vim.keymap.set('n', '<leader>w', '<C-W>', opt)
vim.keymap.set('n', '<leader>sp', ':sp<CR>', opt)
vim.keymap.set('n', '<leader>vs', ':vs<CR>', opt)

vim.keymap.set('n', '<leader>qa', ':wqa<CR>', opt)
vim.keymap.set('n', '<leader>qq', ':q<CR>', opt)

vim.keymap.set('', '<up>', '<nop>', opt)
vim.keymap.set('', '<down>', '<nop>', opt)
vim.keymap.set('', '<left>', '<nop>', opt)
vim.keymap.set('', '<right>', '<nop>', opt)
