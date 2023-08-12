local ls = require("luasnip");
ls.setup({
    enable_autosnippets = true
})

require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets"})


local loaders = require("luasnip.loaders")
vim.keymap.set("n", "<space>ne", loaders.edit_snippet_files, {
    desc = "Edit snippets"
})
