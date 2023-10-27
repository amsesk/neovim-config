-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' 
    use {
        'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

--    use { 'feline-nvim/feline.nvim' }
    use 'nvim-treesitter/nvim-treesitter'
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    use {
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }

    use {
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
    }
    use {'chamindra/marvim'}
    use {
        "ray-x/lsp_signature.nvim",
    }
    use"mbbill/undotree"

    use"tpope/vim-fugitive"

    use'nvim-lua/plenary.nvim'
    use'ThePrimeagen/harpoon'

    --use {'neoclide/coc.nvim', branch = 'release'}
    --use {'jalvesaq/Nvim-R'}

    use {'hkupty/iron.nvim'}
    use {'chentoast/marks.nvim'}

    use 'anuvyklack/pretty-fold.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'anuvyklack/fold-preview.nvim',
        requires = 'anuvyklack/keymap-amend.nvim'
    }

    -- Themes
    --use 'AlexvZyl/nordic.nvim'
    --use {'ray-x/starry.nvim'}
    --use 'glepnir/zephyr-nvim'
    --use "EdenEast/nightfox.nvim"
    --use "sainnhe/edge"
    --use "yonlu/omni.vim"
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use ({ 'projekt0n/caret.nvim' })
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "folke/tokyonight.nvim" }
end)
