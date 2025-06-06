local M = {}

function M.setup()
	local config = require("nvim-grails.config").config.gsp

	if config.enable_syntax then
		vim.cmd([[
            augroup GrailsGSP
                autocmd!
                autocmd BufNewFile,BufRead *.gsp set filetype=gsp
            augroup END
        ]])
	end

	if config.enable_ftplugin then
		-- This will load the ftplugin/gsp.lua file automatically
	end
end

return M
