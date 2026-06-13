return {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { ".git", "settings.gradle", "settings.gradle.kts", "pom.xml" },
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = os.getenv("HOME") .. ".sdkman/candidates/java/21.0.9-zulu",
					},
					{
						name = "JavaSE-17",
						path = os.getenv("HOME") .. ".sdkman/candidates/java/17.0.17-zulu",
					},
					{
						name = "JavaSE-11",
						path = os.getenv("HOME") .. ".sdkman/candidates/java/11.0.29-zulu",
					},
				},
			},
		},
	},
}
