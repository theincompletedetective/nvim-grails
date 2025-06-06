local M = {}

function M.setup()
	local config = require("nvim-grails.config").config

	-- Detect Grails projects and set project-specific settings
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function(args)
			local root_dir = config.lsp.root_dir(args.file)
			if root_dir then
				vim.b.grails_project_root = root_dir
				vim.b.grails_project = true

				-- Set makeprg for Grails projects
				vim.bo.makeprg = "./gradlew build"
			end
		end,
	})
end

return M
