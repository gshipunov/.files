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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- insert images into markdown automagically
  use 'ferrine/md-img-paste.vim'

  --Better syntax
  use 'rust-lang/rust.vim'
  use 'LnL7/vim-nix'
  use 'cespare/vim-toml'
  use 'JuliaEditorSupport/julia-vim'
  use 'lervag/vimtex'
  use 'lepture/vim-jinja'
  use 'neomutt/neomutt.vim'
  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'

  -- pretty bits
  use 'bluz71/vim-moonfly-colors'
  use 'vim-airline/vim-airline'

  -- neovim VSCode edition
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  -- just because cmp requires snippet
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  -- navigating files
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


