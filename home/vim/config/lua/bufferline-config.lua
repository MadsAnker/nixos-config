local bl = require("bufferline")

bl.setup({
	options = {
		indicator = {
			style = "underline"
		},
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true
			}
		}
	}
})

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

vim.keymap.set("n", "<A-S-l>", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<A-S-h>", "<cmd>BufferLineMovePrev<CR>")

local function close_current_buffer()
    local buf = vim.api.nvim_get_current_buf()
    require("custom").buffer_close(buf)
end

vim.keymap.set("n", "<space>c", close_current_buffer, { desc = "Close the current buffer" })
