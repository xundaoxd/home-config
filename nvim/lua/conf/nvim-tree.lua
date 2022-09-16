require("nvim-tree").setup({
    sort_by = "case_sensitive"
})

vim.keymap.set({'n', 'v', 'i'}, '<F2>', ':NvimTreeToggle<CR>', {silent = true, remap = false})
