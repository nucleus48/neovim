return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		styles = {
			keywords = { italic = false },
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd([[color tokyonight]])
	end,
}
