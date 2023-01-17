--[[
-- This file contains the config for nvim-cmp
-- 
-- It is mostly copied from https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
--]]

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Set to SelectBehavior.Select to select instead of inserting completion when navigating completions
local select_opts = {behavior = cmp.SelectBehavior.Insert}

cmp.setup({
    -- Tell cmp what to do with snippets
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    -- Configure sources
    sources = {
        -- I belive that "keyword_length" is what 
        -- makes the completion menu open automatically
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'buffer', keyword_length = 1},
        {name = 'luasnip', keyword_length = 1},
    },
    window = {
        -- Configure the apearence of the documentation window
        documentation = cmp.config.window.bordered()
    },
    -- Used for customizing the 
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω'
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Jumping in snippets
        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
})
