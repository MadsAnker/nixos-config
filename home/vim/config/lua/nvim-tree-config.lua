local tree = require("nvim-tree")

tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
    view = {
        width = 50,
        preserve_window_proportions = true
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = false
            }
        }
    },
    diagnostics = {
        enable = true,
    }
});

vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
