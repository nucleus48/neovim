return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				component_separators = "",
				section_separators = "",
				globalstatus = true,
				theme = "tokyonight",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "searchcount", "selectioncount" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
			extensions = { "avante", "lazy", "neo-tree", "oil", "quickfix", "mason", "toggleterm" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
