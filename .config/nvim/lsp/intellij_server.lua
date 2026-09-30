return {
	cmd = { "intellij-server", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = { ".git", "settings.gradle", "settings.gradle.kts", "pom.xml" },
	single_file_support = true,
	-- settings = {
	-- 	scripts = {
	-- 		enabled = true,
	-- 		buildScriptsEnabled = true,
	-- 	},
	-- },
}
