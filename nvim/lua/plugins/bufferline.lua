local bufferline = require('bufferline')
local commands = require('bufferline.commands')

bufferline.setup()

for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), string.format('<cmd>BufferLineGoToBuffer %s<CR>', i), {})
end

vim.keymap.set({'n', 'v', 'i'}, '<A-j>', '<cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set({'n', 'v', 'i'}, '<A-k>', '<cmd>BufferLineCycleNext<CR>', {})

vim.keymap.set({'n', 'v', 'i'}, '<A-J>', '<cmd>BufferLineMovePrev<CR>', {})
vim.keymap.set({'n', 'v', 'i'}, '<A-K>', '<cmd>BufferLineMoveNext<CR>', {})

vim.keymap.set({'n', 'v', 'i'}, '<A-h>', '<cmd>BufferLineCloseLeft<CR>', {})
vim.keymap.set({'n', 'v', 'i'}, '<A-l>', '<cmd>BufferLineCloseRight<CR>', {})
