vim.cmd([[
let g:vimtex_mappings_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viwer = 'zathura'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-shell-escape'
        \ ],
        \}
]])

vim.keymap.set("n", "<space>tc", "<cmd>VimtexCompile<CR>", { desc = "Start compilation" })
vim.keymap.set("n", "<space>ts", "<cmd>VimtexStop<CR>", { desc = "Stop compilation" })
vim.keymap.set("n", "<space>tr", "<cmd>VimtexClean<CR>", { desc = "Remove generated files" })

