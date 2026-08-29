return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",

			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",

				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,

				dependencies = {
					"rafamadriz/friendly-snippets",
				},
			},
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,

		opts = {
			keymap = { preset = "enter" },

			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},

			completion = { documentation = { auto_show = false } },
			snippets = { preset = "luasnip" },
			cmdline = {
				enabled = false,
				keymap = { preset = "inherit" },
				completion = {
					menu = {
						auto_show = function()
							return vim.fn.getcmdtype() == ":"
						end,
					},
				},
			},
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "rust" },
		},
	},
}
