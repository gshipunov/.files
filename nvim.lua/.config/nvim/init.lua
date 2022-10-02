require'plugins'



-- LSP
-- nix
if vim.fn.executable('rnix-lsp') == 1 then
    require'lspconfig'.rnix.setup{
        autostart = false,
    }
end

-- Rust
if vim.fn.executable('rust-analyzer') == 1 then
    local rt = require'rust-tools'

    rt.setup({
        tools = {
            inlay_hints = {
                auto = true,
                only_current_line = true,
            },
        },
        server = {
            autostart = false,
            on_attach = function(_, bufnr)
                vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
        })


end


-- require'completion'
local cmp = require'cmp'
cmp.setup({
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

