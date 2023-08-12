vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd.colorscheme("monokai");
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Remove some background colors
vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
]]);


vim.opt.clipboard = "unnamedplus"


require("luasnip-config")
require("nvim-cmp-config")
require("telescope-config")
require("which-key-config")
require("alpha-nvim-config")
require("bufferline-config")
require("lightspeed-config")
require("nvim-tree-config")
require("lualine-config")
require("nvim-lsp-config")
require("vimtex-config")
require('gitsigns').setup()
require("treesitter-config")

vim.api.nvim_set_keymap('i', '<C-a>', 'copilot#Accept("")', {expr=true, silent=true})

-- Disable copilot on startup
vim.cmd([[
let g:copilot_filetypes = {
    \ '*': v:false
    \ }
]])

vim.cmd([[
let g:vimtex_syntax_enabled = 1
]])

