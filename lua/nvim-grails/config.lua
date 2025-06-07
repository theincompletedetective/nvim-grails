local M = {}

local default_config = {
	lsp = {
		cmd = {
			"java",
			"-jar",
			"~/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server.jar",
		},
		filetypes = { "groovy", "gsp" },
		root_dir = function(fname)
			local util = require("lspconfig.util")
			return util.root_pattern("build.gradle", "grails-app", "gradle.properties", "settings.gradle")(fname)
		end,
		settings = {
			groovy = {
				classpath = {},
				gradle = {
					enabled = true,
					wrapper = { enabled = true },
				},
				grails = {
					enabled = true,
					autoDetect = true,
				},
				imports = {
					aliases = {
						["grails.gorm"] = "org.grails.datastore.gorm",
						["grails.web"] = "org.grails.web",
					},
				},
			},
		},
	},
	gsp = {
		enable_syntax = true,
		enable_ftplugin = true,
	},
	commands = {
		grails_executable = "./gradlew grails-run-command --args=",
	},
	scaffold = {
		templates_dir = vim.fn.stdpath("config") .. "/grails-templates",
	},
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", default_config, opts or {})
end

return M
