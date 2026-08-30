return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"stevearc/oil.nvim",
		opts = {},
	},

	{
		"folke/neoconf.nvim",
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "▏" } },
	},

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
		opts = {},
	},
}
