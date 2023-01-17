-- Language servers
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- List of language servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("neodev").setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.pylsp.setup({})
lspconfig.rnix.setup({})
lspconfig.hls.setup({})

local lsp = vim.lsp

vim.keymap.set("n", "<space>lf", lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<space>lr", lsp.buf.rename, { desc = "Rename symbol" })
