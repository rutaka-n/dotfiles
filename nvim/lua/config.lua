vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "120"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ","

vim.cmd.colorscheme "catppuccin_mocha"

--  autosave
vim.g.auto_save = 1
vim.g.auto_save_in_insert_mode = 0
vim.g.auto_save_silent = 1

-- use rg for ctrlsf
vim.g.ctrlsf_backend = 'rg'
