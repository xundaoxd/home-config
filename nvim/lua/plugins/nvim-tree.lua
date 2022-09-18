local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end
end

local config = {
    view = {
        adaptive_size = true,
        centralize_selection = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "e", action = "edit", action_cb = edit_or_open },
                { key = "l", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all" }
            }
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
}

require('nvim-tree').setup(config)

vim.keymap.set({ 'n', 'v', 'i' }, '<F2>', ':NvimTreeToggle<CR>', { silent = true, remap = false })
