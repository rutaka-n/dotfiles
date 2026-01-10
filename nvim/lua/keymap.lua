local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", "<Cmd>Explore<CR>")
vim.keymap.set("n", "<cr>", "<Cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>", "<Cmd>WhichKey ','<CR>")

-- nerd tree
vim.keymap.set("n", "<C-\\>", "<Cmd>NERDTreeFind<CR>", opts)
vim.keymap.set("n", "<leader><leader>", "<Cmd>NERDTreeToggle<CR>", opts)

-- lsp
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<Leader>=", ":lua vim.lsp.buf.format()<CR>", opts)

-- fzf
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<leader>b", fzf.buffers)

-- GitGutter
vim.keymap.set("n", "[h", "<cmd>GitGutterPrevHunk<cr>")
vim.keymap.set("n", "]h", "<cmd>GitGutterNextHunk<cr>")

-- CtrlSFP
vim.keymap.set("n", "<leader>a", "<Plug>CtrlSFPrompt")
