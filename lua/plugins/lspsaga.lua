return {
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			symbol_in_winbar = { enable = false },
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
