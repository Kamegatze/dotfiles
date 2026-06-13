vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter")
	.install({
		"rust",
		"java",
		"kotlin",
		"bash",
		"groovy",
		"git_config",
		"gitignore",
		"git_rebase",
		"gitattributes",
		"gitcommit",
	})
	:wait(300000)
