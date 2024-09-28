-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("ui-select")
	end,
	dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
}
