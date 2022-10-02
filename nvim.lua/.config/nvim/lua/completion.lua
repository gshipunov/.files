-- nvim cmp

return require'cmp'.setup({
    snippet = {
        expand = function(args)
            require'snippy'.expand_snippet(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
    }),

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                buffer = '[B]',
                path = '[F]',
                snippy = '[S]',
                nvim_lua = '[vim]',
            })[entry.source.name]

            return vim_item
        end,
    }
})

