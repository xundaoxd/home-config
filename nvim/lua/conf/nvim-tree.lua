require("nvim-tree").setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all" },
            }
        }
    }
})

vim.keymap.set({'n', 'v', 'i'}, '<F2>', ':NvimTreeToggle<CR>', {silent = true, remap = false})
