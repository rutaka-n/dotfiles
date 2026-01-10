return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_makers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luachekrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
    },
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.4",
            },
            completion = {
                enabled = true,
            },
            diagnostics = {
                enabled = true,
                globals = { "vim" },
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
        },
    },
}
