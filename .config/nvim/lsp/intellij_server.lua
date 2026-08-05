return {
	cmd = { "intellij-server", "--stdio" },
	filetypes = { "kotlin", "java" },
	root_markers = { ".git", "settings.gradle", "settings.gradle.kts", "pom.xml" },
	single_file_support = false,
	-- settings = {
	-- 	scripts = {
	-- 		enabled = true,
	-- 		buildScriptsEnabled = true,
	-- 	},
	-- },
}
