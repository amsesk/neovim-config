K = {'nvim-telescope/telescope.nvim',
                        tag = '0.1.4',
                        dependencies = { 'nvim-lua/plenary.nvim' },
                        keys = {
                            { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>", "Fuzzy-find files" },
                            { "<leader>pg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep in files" },
                            { "<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<cr>", "Fuzzy-find buffers" },
                            { "<leader>pc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Fuzzy-find colorschemes" },
                            { "<leader>hh", "<cmd>lua require('mini.visits').list_paths()<cr>", "Fuzzy-find colorschemes" },
                        },
                        config = function()
                            local telescope = require("telescope")
                            telescope.setup(_, opts)
                        end,
                    }
return K
