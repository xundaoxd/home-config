local opt = {silent = true, remap = false}

for i=1,9,1 do
    vim.keymap.set('n', '<leader>'..i, ':b'..i..'<CR>', opt)
end

vim.keymap.set('n', '<leader>w', '<C-W>', opt)
vim.keymap.set('n', '<leader>sp', ':sp<CR>', opt)
vim.keymap.set('n', '<leader>vs', ':vs<CR>', opt)

vim.keymap.set('n', '<leader>aq', ':qa<CR>', opt)
vim.keymap.set('n', '<leader>aw', ':aw<CR>', opt)
vim.keymap.set('n', '<leader>q', ':q<CR>', opt)
