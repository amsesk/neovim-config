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

try_require('marks').setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to cnfigure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>pf', '<cmd>IronRepl<cr>')
--vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

try_require'pretty-fold'.setup()
try_require'fold-preview'.setup()

try_require("cheatsheet").setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },
    bundled_cheatsheets = true,

    -- For plugin specific cheatsheets
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }
    bundled_plugin_cheatsheets = true,

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,

    -- Key mappings bound inside the telescope window
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})

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

-- Try to change the colorscheme, but do nothing if it fails
--local ok, _ = pcall(vim.cmd.colorscheme, 'zephyr')
local ok, _ = pcall(vim.cmd.colorscheme, 'mariana')

