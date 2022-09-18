local function buf_is_valid(buf_num)
  if not buf_num or buf_num < 1 then return false end
  local exists = vim.api.nvim_buf_is_valid(buf_num)
  return vim.bo[buf_num].buflisted and exists
end
local function switch_buf(buf_id)
    local bufs = vim.api.nvim_list_bufs()
    local valid_bufs = vim.tbl_filter(buf_is_valid, bufs)
    if valid_bufs[buf_id] then
        vim.api.nvim_win_set_buf(0, valid_bufs[buf_id])
    end
end
local opt = {silent = true, remap = false}

for i=1,9,1 do
    vim.keymap.set('n', '<leader>'..i, function() switch_buf(i) end)
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

vim.keymap.set({'n', 'v'}, 'H', '^', opt)
vim.keymap.set({'n', 'v'}, 'L', '$', opt)
vim.keymap.set({'n', 'v'}, 'J', '5j', opt)
vim.keymap.set({'n', 'v'}, 'K', '5k', opt)

vim.keymap.set('', '<C-s>', ':w<CR>', opt)
vim.keymap.set('n', '<leader>qa', ':wqa<CR>', opt)
vim.keymap.set('n', '<leader>qq', ':q<CR>', opt)

vim.keymap.set('', '<up>', '<nop>', opt)
vim.keymap.set('', '<down>', '<nop>', opt)
vim.keymap.set('', '<left>', '<nop>', opt)
vim.keymap.set('', '<right>', '<nop>', opt)
