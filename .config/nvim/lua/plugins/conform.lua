return {
	"stevearc/conform.nvim",
	optional = true,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			json = { "jq" },
			xml = { "xmlformat" },
			java = { "google-java-format" },
			kotlin = { "ktfmt" },
			yaml = { "yamlfmt" },
			toml = { "taplo" },
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
			xmlformat = {
				args = { "--selfclose", "--indent", "4", "$FILENAME" },
			},
			["google-java-format"] = {
				append_args = { "--aosp" },
			},
			jq = {
				append_args = { "--indent", "2" },
			},
		},
	},
}
