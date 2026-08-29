local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		rust = { "rustfmt" },
		python = { "black" },
	},
}

return {
	{
		"stevearc/conform.nvim",
		opts = options,
		cmd = { "ConformInfo" },
	},
}
