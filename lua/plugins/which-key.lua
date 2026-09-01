function config(_, opts)
	require("which-key").setup(opts)
	local wk = require("which-key")
	wk.add({
		{ "<leader>l", group = "lsp" },
		{ "<leader>f", group = "telescope" },
		{ "<leader>s", group = "search" },
		{ "<leader>g", group = "git" },
	})
end

return {
	{
		"folke/which-key.nvim",
		opts = { icons = { mappings = false } },
		config = config,
		keys = { "<leader>" },
	},
}
