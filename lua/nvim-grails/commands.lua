local M = {}

function M.setup()
	local config = require("nvim-grails.config").config

	-- Create Grails commands
	vim.api.nvim_create_user_command("GrailsCommand", function(opts)
		local cmd = config.commands.grails_executable .. "'" .. opts.args .. "'"
		vim.notify("Running: " .. cmd)
		vim.fn.termopen(cmd)
	end, {
		nargs = 1,
		complete = function()
			return {
				"run-app",
				"stop-app",
				"clean",
				"compile",
				"test-app",
				"generate-controller",
				"generate-domain",
				"generate-service",
			}
		end,
	})

	-- Common Grails commands as direct commands
	local commands = {
		RunApp = "run-app",
		StopApp = "stop-app",
		Clean = "clean",
		Compile = "compile",
		TestApp = "test-app",
	}

	for name, cmd in pairs(commands) do
		vim.api.nvim_create_user_command("Grails" .. name, function()
			vim.cmd("GrailsCommand " .. cmd)
		end, {})
	end
end

return M
