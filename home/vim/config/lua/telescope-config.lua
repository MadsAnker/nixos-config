local ts = require("telescope")
local builtin = require("telescope.builtin")

ts.setup({});
require("telescope").load_extension("ui-select")

vim.keymap.set("n", "<space>f", builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<space>sg", builtin.live_grep, { desc = "Live grep" })
-- Searches for string under cursor
vim.keymap.set("n", "<space>sc", builtin.grep_string, { desc = "Find word under cursor" })
vim.keymap.set("n", "<space>sf", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
vim.keymap.set("n", "<space>sb", builtin.git_branches, { desc = "Find branch"})
