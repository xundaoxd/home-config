local mason = require('mason')
local common = require('plugins.nvim-cmp.common')

mason.setup({
    install_root_dir = vim.fn.stdpath('config')..'/pack/mason'
})

local function MasonInstallAll()
    for _, v in pairs(common.lsp_mason) do
        require('mason.api.command').MasonInstall(v.mason)
    end
end

vim.api.nvim_create_user_command("MasonInstallAll", MasonInstallAll, {})

