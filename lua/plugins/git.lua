return {
	{ "lewis6991/gitsigns.nvim", opts = {} },

	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim", -- optional
			"m00qek/baleia.nvim", -- optional
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
}
