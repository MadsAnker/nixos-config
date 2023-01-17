local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
	dashboard.button("f", " Find file", ":Telescope find_files<CR>")
}

alpha.setup(dashboard.config)
