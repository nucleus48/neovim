-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	event = { "BufEnter" },
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		telescope.load_extension("ui-select")
	end,
	dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
}
