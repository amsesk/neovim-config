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
    
    use {'hkupty/iron.nvim'}
    use {'chentoast/marks.nvim'}
    use 'AlexvZyl/nordic.nvim'
    
    use 'anuvyklack/pretty-fold.nvim'

    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
	}
    }
    use {
        'anuvyklack/fold-preview.nvim',
        requires = 'anuvyklack/keymap-amend.nvim'
    }

    -- use {'ms-jpq/coq_nvim', branch = 'coq'}
    -- use {'ms-jpq/coq.artifacts', branch = "artifacts"}
    -- use {'ms-jpq/coq.thirdparty', branch = "3p" }
    -- use {'neovim/nvim-lspconfig'} 
end)
