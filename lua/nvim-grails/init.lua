local M = {}

function M.setup(opts)
	local config = require("nvim-grails.config")
	config.setup(opts or {})

	require("nvim-grails.project").setup()
	require("nvim-grails.lsp").setup()
	require("nvim-grails.commands").setup()
	require("nvim-grails.gsp").setup()
	require("nvim-grails.scaffold").setup()
end

return M
