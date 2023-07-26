local bufferline = require('bufferline')
bufferline.setup()

for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), string.format('<cmd>BufferLineGoToBuffer %s<CR>', i), {})
end
vim.keymap.set({'n', 'v', 'i'}, '<A-]>', '<cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set({'n', 'v', 'i'}, '<A-[>', '<cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set({'n', 'v', 'i'}, '<A-}>', '<cmd>BufferLineMoveNext<CR>', {})
vim.keymap.set({'n', 'v', 'i'}, '<A-{>', '<cmd>BufferLineMovePrev<CR>', {})

