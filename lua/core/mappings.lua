local term_count = 1

local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})

	vim.keymap.set(mode, lhs, rhs, opts)
end

local function new_terminal(direction)
	local Terminal = require("toggleterm.terminal").Terminal
	local term = Terminal:new({ direction = direction, count = term_count })
	map(
		"n",
		string.format("<M-%d>", term_count),
		string.format(":%dToggleTerm direction=%s<cr>", term_count, direction)
	)
	term_count = term_count + 1
	term:toggle()
end

map("n", "<C-s>", ":w<cr>")
map("n", "<leader>w", ":w<cr>")
map("n", "<Tab>", ":bnext<cr>")
map("n", "<S-Tab>", ":bprevious<cr>")
map("n", "<leader>c", ":bdelete<cr>")
map("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<leader>fm", ":Telescope media_files<cr>")

-- ToggleTerm
map("n", "<leader>ts", ":TermSelect<cr>")
map("n", "<leader>tt", ":ToggleTermToggleAll<cr>")
map("n", "<leader>tv", function()
	new_terminal("vertical")
end)
map("n", "<leader>tf", function()
	new_terminal("float")
end)
map("n", "<leader>th", function()
	new_terminal("horizontal")
end)
