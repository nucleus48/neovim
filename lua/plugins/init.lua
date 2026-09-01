return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		cmd = { "RenderMarkdown" },
		opts = {
			completions = { lsp = { enabled = true } },
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufEnter", "BufWinEnter", "BufNew" },
	},

	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {},
	},

	{
		"folke/neoconf.nvim",
		lazy = false,
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "▏" } },
		event = { "BufEnter", "BufWinEnter", "BufNew" },
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "InsertEnter" },
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		event = { "BufEnter", "BufWinEnter", "BufNew" },
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		keys = { "gcc", "gbc", "gc", "gb" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
