K = {'nvim-telescope/telescope.nvim',
                        tag = '0.1.4',
                        dependencies = { 
                            "nvim-lua/plenary.nvim",
                            --"debugloop/telescope-undo.nvim",
                        },
                        keys = {
                            { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>", "Fuzzy-find files" },
                            { "<leader>pg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep in files" },
                            { "<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<cr>", "Fuzzy-find buffers" },
                            { "<leader>pc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Fuzzy-find colorschemes" },
                            { "<leader>u", "<cmd>Telescope undo<cr>", "Fuzzy-find undo tree." },
                        },
                        config = function()
                            local telescope = require("telescope")
                            telescope.setup(_, opts)
                            --telescope.load_extension("undo")
                        end,
                    }
return K
