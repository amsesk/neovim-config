K = {'nvim-telescope/telescope.nvim',
                        tag = '0.1.4',
                        dependencies = { 
                            "nvim-lua/plenary.nvim",
                            --"debugloop/telescope-undo.nvim",
                        },
                        lazy = true,
                        keys = {
                            -- { "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>", "Fuzzy-find files" },
                            -- { "<leader>pg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep in files" },
                            -- { "<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<cr>", "Fuzzy-find buffers" },
                            { "<leader>pc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Fuzzy-find colorschemes" },
                            { "<leader>pm", "<cmd>lua require('telescope.builtin').marks()<cr>", "Fuzzy-find marks" },
                            { "<leader>pk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Fuzzy-find keybindings" },
                            { "<leader>pt", "<cmd>Telescope toggleterm_repl<cr>", "Fuzzy-find open toggleterm-repls." },

                            { "<leader>u", "<cmd>Telescope undo<cr>", "Fuzzy-find undo tree." },
                        },
                        config = function()
                            local telescope = require("telescope")
                            telescope.setup(_, opts)
                            telescope.load_extension("toggleterm_repl")
                            telescope.load_extension('macros')
                        end,
                    }
return {}
