-- this now handled by the lualine
vim.cmd([[set noshowmode]])

return require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'moonfly',
        -- section_separators = '',
        -- component_seaparators = '',
    }
}
