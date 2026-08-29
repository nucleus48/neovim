local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})

	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>fm", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "format" })

map("n", "<C-z>", "<cmd><cr>")
map("n", ";", ":")
map("n", "<C-s>", "<cmd>w<cr>", { desc = "save" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save" })
map("n", "<leader>x", "<cmd>q<cr>", { desc = "quit" })

-- Barbar
map("n", "<leader>c", "<cmd>BufferClose<cr>", { desc = "close" })
map("n", "<Tab>", "<cmd>BufferNext<cr>", { desc = "next" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<cr>", { desc = "previous" })

-- Lspsaga
map("n", "gc", "<cmd>Lspsaga incoming_calls<cr>", { desc = "incomming calls" })
map("n", "<A-o>", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "outgoing calls" })
map("n", "ga", "<cmd>Lspsaga code_action<cr>", { desc = "code action" })
map("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { desc = "peek definition" })
map("n", "ge", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "peek type definition" })
map("n", "gl", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "diagnostic next" })
map("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "diagnostic previous" })
map("n", "gd", "<cmd>Lspsaga finder def<cr>", { desc = "definition" })
map("n", "<A-r>", "<cmd>Lspsaga finder ref<cr>", { desc = "references" })
map("n", "gi", "<cmd>Lspsaga finder imp<cr>", { desc = "implimentations" })
map("n", "gt", "<cmd>Lspsaga finder tyd<cr>", { desc = "type definition" })
map("n", "go", "<cmd>Lspsaga outline", { desc = "outline" })
map("n", "gr", "<cmd>Lspsaga rename ++project<cr>", { desc = "rename" })
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "hover" })
map({ "n", "t" }, "<A-f>", "<cmd>Lspsaga term_toggle<cr>", { desc = "toggle terminal" })

-- Neotree
map("n", "<C-n>", "<cmd>Neotree toggle=true<cr>", { desc = "explorer" })

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
