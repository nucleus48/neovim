function config()
	local x = vim.diagnostic.severity

	vim.diagnostic.config({
		signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
		underline = true,
	})

	vim.lsp.config("*", {
		capabilities = require("nvim-file-operations.config").default_capabilities(),
	})

	vim.lsp.config("lua_ls", {
		---@type lspconfig.settings.lua_ls
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					preloadFileSize = 10000,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	})

	vim.lsp.config("jsonls", {
		---@type lspconfig.settings.jsonls
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	vim.lsp.config("yamlls", {
		settings = {
			yaml = {
				schemaStore = { enable = false, url = "" },
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
		dependencies = {
			"b0o/schemastore.nvim",
			"folke/neoconf.nvim",
		},
	},
}
