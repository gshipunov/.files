local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local setup_fzf = function()
    vim.api.nvim_set_keymap('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- insert images into markdown automagically
    use {
        'ferrine/md-img-paste.vim',
        ft = { 'markdown' },
        config = vim.cmd([[
        " insert images into markdown automagically
        autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
        let g:mdip_imgdir = 'static'
        let g:mdip_imgname = 'image'
        ]])
    }

    --Better syntax
    use 'rust-lang/rust.vim'
    use 'LnL7/vim-nix'
    use 'cespare/vim-toml'
    use 'JuliaEditorSupport/julia-vim'
    use {
        'lervag/vimtex',
        ft = { 'tex' },
        -- do not conceal stuff
        config = function() vim.cmd([[
            let g:tex_conceal = ''
            autocmd FileType tex nnoremap <localleader>= :VimtexTocToggle<CR>
        ]]) end,
    }
    use 'lepture/vim-jinja'
    use 'neomutt/neomutt.vim'
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require('ts_setup')
        end,
    }

    use {
        'sainnhe/everforest',
        config = function()
            vim.cmd([[
            set termguicolors
            let g:everforest_transparent_background = 2
            colorscheme everforest
            ]])
        end,
    }

    use {
        'johnfrankmorgan/whitespace.nvim',
        config = function ()
            require('whitespace-nvim').setup({
                ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
            })

            -- remove trailing whitespace with a keybinding
            vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        -- after = { 'zen-footburn.nvim' },
        config = function()
            require('lualine_setup')
        end,
    }

    -- Git
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            vim.cmd([[set signcolumn=yes]])
            require('gitsigns').setup()
        end,
    }

    -- Nifty stuff
    use 'tpope/vim-surround'
    -- use {
    --     'ibhagwan/fzf-lua',
    --     config = setup_fzf(),
    -- }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = 'Telescope find git ls-files' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end,
    }


    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- completion sources
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'dcampos/nvim-snippy',
            'dcampos/cmp-snippy'
        },
        config = function()
            require('completion')
        end,
    }

    use {
        'dcampos/nvim-snippy',
        config = function()
            require'snippy'.setup({
                mappings = {
                    is = {
                        ['<Tab>'] = 'expand_or_advance',
                        ['<S-Tab>'] = 'previous',
                    },
                    nx = {
                        ['<leader>x'] = 'cut_text',
                    },
                },
            })
        end,
    }
    use 'dcampos/cmp-snippy'
    use 'honza/vim-snippets'

    -- neovim VSCode edition
    use {
        'neovim/nvim-lspconfig',
        after = { 'nvim-cmp' },
        config = function()
            require'lsp_setup';
        end,
        requires = { 'mrcjkb/rustaceanvim' },
    }

    use {
        'jamessan/vim-gnupg',
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


