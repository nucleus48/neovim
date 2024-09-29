return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm" },
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.3
			end
		end,
		shade_terminals = true,
		highlights = {
			FloatBorder = {
				link = "FloatBorder",
			},
		},
		direction = "horizontal",
		shell = "pwsh.exe",
		float_opts = {
			border = "single",
		},
	},
}
