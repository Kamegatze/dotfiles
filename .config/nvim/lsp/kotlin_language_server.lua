return {
	cmd = { "kotlin-language-server" },
	filetypes = { "kotlin" },
	root_markers = { ".git", "settings.gradle", "settings.gradle.kts", "pom.xml" },
	settings = {
		scripts = {
			enabled = true,
			buildScriptsEnabled = true,
		},
	},
}
