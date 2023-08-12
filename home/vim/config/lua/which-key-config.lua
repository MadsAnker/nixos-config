local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        spelling = {
            enabled = true,
            suggestions = 10
        }
    }
})

wk.register({
    s = { name = "Search" },
    l = { name = "LSP" },
    t = { name = "LaTeX" },
    h = { name = "No highlight", silent = true, cmd = ":noh<CR>" },
    n = { name = "Snippets" }
}, { prefix = "<space>" })
