return {
	"nvim-lua/plenary.nvim",

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		vim.notify = require("notify")
	-- 	end,
	-- },

	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = {},
		lazy = true,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
