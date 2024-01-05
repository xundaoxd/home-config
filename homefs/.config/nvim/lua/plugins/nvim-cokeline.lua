local get_hex = require('cokeline.hlgroups').get_hl_attr

require('cokeline').setup({
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and get_hex('ColorColumn', 'bg') or get_hex('Normal', 'fg')
        end,
        bg = function(buffer)
            return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('ColorColumn', 'bg')
        end,
    },
    components = {
        {
            text = function(buffer) return ' ' .. buffer.index .. '.' end,
        },
        {
            text = function(buffer) return ' ' .. buffer.devicon.icon end,
            fg = function(buffer) return buffer.devicon.color end,
        },
        {
            text = function(buffer) return buffer.filename .. ' ' end,
            underline = function(buffer)
                return buffer.is_hovered and not buffer.is_focused
            end
        },
    }
})

for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), string.format('<Plug>(cokeline-focus-%s)', i))
end

vim.keymap.set({'n', 'v', 'i'}, '<A-h>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set({'n', 'v', 'i'}, '<A-l>', '<Plug>(cokeline-focus-next)')

vim.keymap.set({'n', 'v', 'i'}, '<A-H>', '<Plug>(cokeline-switch-prev)')
vim.keymap.set({'n', 'v', 'i'}, '<A-L>', '<Plug>(cokeline-switch-next)')

