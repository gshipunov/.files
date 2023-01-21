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
        config = vim.cmd([[ let g:tex_conceal = '' ]]),
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

    -- pretty bits
    use {
        'bluz71/vim-moonfly-colors',
        config = function()
            vim.cmd([[ set termguicolors
            colorscheme moonfly ]])
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	after = { 'vim-moonfly-colors' },
        config = function()
            require('lualine_setup')
        end,
    }

    -- Git
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        config = function()
            require('gitsigns').setup()
        end,
    }

    -- Nifty stuff
    use 'tpope/vim-surround'
    use 'airblade/vim-rooter'
    use {
        'ibhagwan/fzf-lua',
        config = setup_fzf(),
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
             -- snippets (hard requirement by cmp)
             'dcampos/nvim-snippy',
             'dcampos/cmp-snippy'
         },
         config = function()
             require('completion')
         end,
     }

    -- neovim VSCode edition
    use {
        'neovim/nvim-lspconfig',
        ft = {
            'rust',
            'nix',
            -- 'python',
        },
        after = { 'nvim-cmp' },
        requires = { 'simrat39/rust-tools.nvim' },
        config = function()
            require'lsp_setup'
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


