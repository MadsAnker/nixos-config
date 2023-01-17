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
    t = { name = "LaTeX" }
}, { prefix = "<space>" })
