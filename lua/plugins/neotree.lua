return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"Crysthamus/nvim-file-operations",
		-- branch = "compat" -- if you are on Neovim <= 0.10
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("nvim-file-operations").setup({
				will_rename_files = true,
				did_rename_files = true,
				will_create_files = true,
				did_create_files = true,
				will_delete_files = true,
				did_delete_files = true,
				-- How long to wait (in milliseconds) for LSP responses before cancelling
				timeout_ms = 10000,
				-- Saves modifies files after renames, moves, etc.
				auto_save = false,
			})
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
