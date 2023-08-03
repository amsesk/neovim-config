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

-- If using coq completion
--vim.g.coq_settings = { ["auto_start"] = "shut-up",
--    ["display.pum.source_context"] = {'', ''}, }
--require("coq")

-- Packer plugins
require('plugins').install()
require('coc_config')

-- try_require'lspconfig'.r_language_server.setup{ log_level = 1}

try_require'lualine'.setup {
    options = { theme = try_require'lualine.themes.horizon' },
}
try_require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "bash", "c", "lua", "vim", "vimdoc", "python", "r", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --        return true
    --    end
    --end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Nvim-R settings
vim.api.nvim_set_var('R_assign', 0)
vim.api.nvim_set_var('maplocalleader', "'")
vim.api.nvim_set_var('R_external_term', 0)

-- Iron settings
local view = try_require("iron.view")
try_require("iron.core").setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
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
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
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
vim.keymap.set('n', '<localleader>pf', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

--vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")

-- enable ncm2 for all buffers
-- vim.api.nvim_create_autocmd("BufEnter", { command = "[[call ncm2#enable_for_buffer()]]" })

--- IMPORTANT: :help Ncm2PopupOpen for more information
--vim.o.completeopt = "noinsert,menuone,noselect"

-- Nvim settings
vim.o.number = true
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.cursorcolumn = false

-- Try to change the colorscheme, but do nothing if it fails
--local ok, _ = pcall(vim.cmd.colorscheme, 'zephyr')
local ok, _ = pcall(vim.cmd.colorscheme, 'nordic')

