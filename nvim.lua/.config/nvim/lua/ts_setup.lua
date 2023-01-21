local ts_conf = require('nvim-treesitter.configs')

ts_conf.setup {
    ensure_installed =  "all",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
    },
    textobjects = {
        enable = true,
    },
}
