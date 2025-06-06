local M = {}

function M.setup(opts)
	local config = require("nvim-grails.config")
	config.setup(opts or {})

	local lsp = require("nvim-grails.lsp")
	lsp.setup()
end

return M
