vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		fish = { "fish_indent" },
		sh = { "shfmt" },
		json = { "jq" },
		xml = { "xmlformatter" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
		yaml = { "yamlfmt" },
	},
	formatters = {
		injected = { options = { ignore_errors = true } },
		-- # Example of using dprint only when a dprint.json file is present
		-- dprint = {
		--   condition = function(ctx)
		--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
		--   end,
		-- },
		--
		-- # Example of using shfmt with extra args
		-- shfmt = {
		--   prepend_args = { "-i", "2", "-ci" },
		-- },
		["google-java-format"] = {
			append_args = { "--aosp" },
		},
		jq = {
			append_args = { "--indent", "2" },
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
