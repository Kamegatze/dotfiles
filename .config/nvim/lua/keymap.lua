vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>", { desc = "Open Neotree" })

vim.keymap.set(
	"n",
	"gd",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	{ desc = "Goto Definition", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gr",
	"<cmd>lua vim.lsp.buf.references()<CR>",
	{ desc = "References", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gi",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	{ desc = "Goto Implementation", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gY",
	"<cmd>lua vim.lsp.buf.type_definition()<CR>",
	{ desc = "Goto T[y]pe Definition", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.declaration()<CR>",
	{ desc = "Goto Declaration", noremap = true, silent = true }
)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"gK",
	"<cmd>lua vim.lsp.buf.signature_help()<CR>",
	{ desc = "Signature Help", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>cf",
	"<cmd>lua require('conform').format()<CR>",
	{ desc = "Format lsp code", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n", "x" },
	"<leader>ca",
	"<cmd>lua vim.lsp.buf.code_action()<CR>",
	{ desc = "Code Action", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n", "x" },
	"<leader>cc",
	"<cmd>lua vim.lsp.codelens.run()<CR>",
	{ desc = "Run Codelens", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n" },
	"<leader>cC",
	"<cmd>lua vim.lsp.codelens.refresh()<CR>",
	{ desc = "Refresh & Display Codelens", noremap = true, silent = true }
)
vim.keymap.set(
	{ "n" },
	"<leader>cr",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	{ desc = "Rename", noremap = true, silent = true }
)

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move cursor to left to window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move cursor to down to window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move cursor to up to window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move cursor to right to window", remap = true })

-- move down on one line
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- move up on one line
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- move down on one line
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- move up on one line
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- move down on one line
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- move up on one line
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- move tab in right
vim.keymap.set({ "n", "v" }, "<S-l>", "<Cmd>tabNext<CR>", { desc = "Move tab in right" })
-- move tab in left
vim.keymap.set({ "n", "v" }, "<S-h>", "<Cmd>tabprevious<CR>", { desc = "Move tab in left" })

vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>wr", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Find files by name" })
vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Find grep content in files" })
