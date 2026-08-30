local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})

	vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "n", "x" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "format" })

map("n", ";", ":")
map("n", "<C-s>", "<cmd>w<cr>", { desc = "save" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })

-- Barbar
map("n", "<leader>c", "<cmd>BufferClose<cr>", { desc = "close" })
map("n", "<Tab>", "<cmd>BufferNext<cr>", { desc = "next" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<cr>", { desc = "previous" })

-- Lspsaga
map("n", "<leader>li", "<cmd>Lspsaga incoming_calls<cr>", { desc = "incomming calls" })
map("n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "outgoing calls" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "code action" })
map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", { desc = "peek definition" })
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "peek type definition" })
map("n", "<leader>ld", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "diagnostic next" })
map("n", "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "diagnostic previous" })
map("n", "<leader>lR", "<cmd>Lspsaga finder ref<cr>", { desc = "references" })
map("n", "<leader>lD", "<cmd>Lspsaga finder def<cr>", { desc = "definition" })
map("n", "<leader>lI", "<cmd>Lspsaga finder imp<cr>", { desc = "implimentations" })
map("n", "<leader>lT", "<cmd>Lspsaga finder tyd<cr>", { desc = "type definition" })
map("n", "<leader>lO", "<cmd>Lspsaga outline", { desc = "outline" })
map("n", "<leader>lr", "<cmd>Lspsaga rename ++project<cr>", { desc = "rename" })
map("n", "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", { desc = "hover" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "help page" })
map("n", "<leader>fa", "<cmd>Telescope marks<CR>", { desc = "find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "find in current buffer" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "git status" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "explorer" })
map("n", "<leader>E", "<cmd>Neotree toggle float<cr>", { desc = "explorer float" })

-- Grugfar
map({ "n", "x" }, "<leader>si", function()
	require("grug-far").open({ visualSelectionUsage = "auto-detect" })
end, { desc = "grug-far: Search within range" })

map({ "n", "x" }, "<leader>ss", function()
	local search = vim.fn.getreg("/")
	-- surround with \b if "word" search (such as when pressing `*`)
	if search and vim.startswith(search, "\\<") and vim.endswith(search, "\\>") then
		search = "\\b" .. search:sub(3, -3) .. "\\b"
	elseif search and vim.startswith(search, "\\V") then
		search = search:sub(3)
	end
	local inst = require("grug-far").open({
		prefills = {
			search = search,
		},
	})
	inst:when_ready(function()
		inst:goto_input("replacement")
	end)
end, { desc = "grug-far: Search using @/ register value or visual selection" })
