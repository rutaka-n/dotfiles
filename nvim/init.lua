local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('catppuccin/vim', { ['as'] = 'catppuccin' })
Plug('mason-org/mason.nvim') -- pkg manager for lsp servers

Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')

Plug('ibhagwan/fzf-lua') -- fuzzy search

Plug('dyng/ctrlsf.vim')  -- find in files

Plug('saghen/blink.cmp')

Plug('kamykn/spelunker.vim') -- spellcheck

Plug('preservim/nerdtree')   -- file explorer

Plug('907th/vim-auto-save')

Plug('liuchengxu/vim-which-key') -- show commands

Plug('tpope/vim-fugitive')       -- git
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('editorconfig/editorconfig-vim')

vim.call('plug#end')

require('mason').setup({})
require('lualine').setup({})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust' },
    signature = { enabled = true },
    keymap = { preset = "default" },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})

require("config")
require("autocmd")
require("keymap")
require("lsp")
