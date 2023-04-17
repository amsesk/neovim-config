-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'glepnir/zephyr-nvim'

    use {'chamindra/marvim'}

    use {'neoclide/coc.nvim', branch = 'release'}
    use {'jalvesaq/Nvim-R'}

    -- use {'ms-jpq/coq_nvim', branch = 'coq'}
    -- use {'ms-jpq/coq.artifacts', branch = "artifacts"}
    -- use {'ms-jpq/coq.thirdparty', branch = "3p" }
    -- use {'neovim/nvim-lspconfig'} 
end)
