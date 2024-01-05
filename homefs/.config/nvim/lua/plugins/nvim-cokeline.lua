local hlgroups = require('cokeline.hlgroups')
local mappings = require('cokeline.mappings')

require('cokeline').setup({
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and hlgroups.get_hl_attr('ColorColumn', 'bg') or hlgroups.get_hl_attr('Normal', 'fg')
        end,
        bg = function(buffer)
            return buffer.is_focused and hlgroups.get_hl_attr('Normal', 'fg') or hlgroups.get_hl_attr('ColorColumn', 'bg')
        end,
    },
    components = {
        {
            text = '|'
        },
        {
            text = function(buffer) return ' ' .. buffer.index .. ':' end,
        },
        {
            text = function(buffer) return ' ' .. buffer.devicon.icon end,
            fg = function(buffer) return buffer.devicon.color end,
        },
        {
            text = function(buffer) return buffer.filename .. ' ' end,
            bold = function(buffer) return buffer.is_focused end,
            underline = function(buffer) return buffer.is_hovered end,
        },
    },
    sidebar = {
        filetype = {'NvimTree'},
        components = {
            {
                text = function(buf) return buf.filetype end,
                blod = true,
            }
        }
    }
})

for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), string.format('<Plug>(cokeline-focus-%s)', i))
end

vim.keymap.set({'n', 'v', 'i'}, '<A-h>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set({'n', 'v', 'i'}, '<A-l>', '<Plug>(cokeline-focus-next)')

vim.keymap.set({'n', 'v', 'i'}, '<A-H>', '<Plug>(cokeline-switch-prev)')
vim.keymap.set({'n', 'v', 'i'}, '<A-L>', '<Plug>(cokeline-switch-next)')

vim.keymap.set({'n', 'v', 'i'}, '<A-K>', function() mappings.by_step('close', 1) end)
vim.keymap.set({'n', 'v', 'i'}, '<A-J>', function() mappings.by_step('close', -1) end)

