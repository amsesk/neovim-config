K = { "carbon-steel/detour.nvim",
    config = function ()
	vim.keymap.set('n', '<leader>puf', function()
    	require('detour').Detour()               -- Open a detour popup

    	-- Switch to a blank buffer to prevent any accidental changes.
    	vim.cmd.enew()
    	vim.bo.bufhidden = 'delete'

    	require('telescope.builtin').find_files({}) -- Open telescope prompt
    	--vim.api.nvim_feedkeys("term", "n", true) -- popuplate prompt with "term"
        end)


	vim.keymap.set('n', '<leader>pub', function()
            require('detour').Detour()               -- Open a detour popup

            -- Switch to a blank buffer to prevent any accidental changes.
            vim.cmd.enew()
            vim.bo.bufhidden = 'delete'

            require('telescope.builtin').buffers({}) -- Open telescope prompt
            --vim.api.nvim_feedkeys("term", "n", true) -- popuplate prompt with "term"
        end)

        vim.keymap.set("n", '<leader>tt', function ()
            require('detour').Detour()  -- open a detour popup
            vim.cmd.terminal()          -- open a terminal buffer
            vim.bo.bufhidden = 'hide' -- close the terminal when window closes
    end)
   end
}
return K
