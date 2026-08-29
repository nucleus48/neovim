return {
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			finder = {
				methods = {
					tyd = "textDocument/typeDefinition",
				},
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
