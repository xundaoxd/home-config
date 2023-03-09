local utils = require('utils')

-- tab
local function switch_buf(buf_idx)
    return function()
        utils.switch_buf(buf_idx)
    end
end
local function hidden_current_buf()
    local valid_bufs = utils.valid_bufs()
    local buf_id = vim.api.nvim_get_current_buf()
    for k, v in ipairs(valid_bufs) do
        if v == buf_id then
            utils.hidden_buf(k)
        end
    end
end
for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), switch_buf(i))
end
vim.keymap.set('n', '<leader>wc', hidden_current_buf)

-- window
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>sp', ':split<CR>')
vim.keymap.set('n', '<leader>vs', ':vs<CR>')

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
vim.keymap.set('n', '<leader>dd', '"+dd')
vim.keymap.set('n', '<leader>dw', '"+dw')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>yw', 'viw"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

vim.keymap.set('n', 'dL', 'd$')
vim.keymap.set('n', 'dH', 'd0')

-- exit
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<leader>qq', ':wqa!<CR>')
vim.keymap.set('n', '<leader>qa', ':qa!<CR>')
vim.keymap.set('n', '<leader>qw', ':q!<CR>')

-- misc
vim.keymap.set({'n', 'v', 'i'}, '<up>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<down>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<left>', '<nop>')
vim.keymap.set({'n', 'v', 'i'}, '<right>', '<nop>')

