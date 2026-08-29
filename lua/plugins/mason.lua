---@class MasonSettings
local options_mason = {
	firewall = {
		enabled = true,
	},
}

local options_mason_lspconfig = {
	automatic_enable = true,
}

return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason" },
		opts = options_mason,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = options_mason_lspconfig,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
