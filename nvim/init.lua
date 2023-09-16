nullmodule = {}
function nullmodule:setup(...)
    return {}
end

function try_require(module_name) 
    local ok, module = pcall(require, module_name);
    if ok then
        return module
    else    
        return nullmodule 
    end
end

-- Packer plugins
require('plugins').install()


-- try_require'lspconfig'.r_language_server.setup{ log_level = 1}

try_require'lualine'.setup {
    options = { theme = try_require'lualine.themes.horizon' },
}

-- Nvim-R settingips
vim.api.nvim_set_var('R_assign', 0)
vim.api.nvim_set_var('maplocalleader', "'")
vim.api.nvim_set_var('mapleader', " ")
vim.api.nvim_set_var('R_external_term', 0)

-- Iron settings
local view = try_require("iron.view")
try_require("iron.core").setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions comee
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      }
    },

    repl_open_cmd = view.split.bot("35%"),
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(10),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>mm",
    visual_send = "<space>sv",
    send_file = "<space>sf",
    send_line = "<space>ll",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mv",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>i<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>pf', '<cmd>IronRepl<cr>')
--vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")

try_require'pretty-fold'.setup()
try_require'fold-preview'.setup()

--try_require 'nordic' .setup {
    -- This callback can be used to override the colors used in the palette.
--    on_palette = function(palette) 
--       palette.fg_sidebar = "#FFFFFF"
--        return palette
--    end,
--}
--

--vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")

-- enable ncm2 for all buffers
-- vim.api.nvim_create_autocmd("BufEnter", { command = "[[call ncm2#enable_for_buffer()]]" })

--- IMPORTANT: :help Ncm2PopupOpen for more information
--vim.o.completeopt = "noinsert,menuone,noselect"

-- Nvim settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.foldcolumn = "auto"
vim.o.termguicolors = true

-- Try to change the colorscheme, but do nothing if it fails
--local ok, _ = pcall(vim.cmd.colorscheme, 'zephyr')
local ok, _ = pcall(vim.cmd.colorscheme, 'rose-pine')

