-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
			media_files = {
				filetypes = { "png", "webp", "jpg", "jpeg" },
				find_cmd = "rg",
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("ui-select")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
