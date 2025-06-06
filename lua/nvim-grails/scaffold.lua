local M = {}

function M.setup()
	local config = require("nvim-grails.config").config.scaffold

	-- Ensure templates directory exists
	if vim.fn.isdirectory(config.templates_dir) == 0 then
		vim.fn.mkdir(config.templates_dir, "p")
	end

	-- Scaffolding commands
	vim.api.nvim_create_user_command("GrailsGenerate", function(opts)
		local parts = vim.split(opts.args, " ")
		if #parts < 2 then
			vim.notify("Usage: GrailsGenerate [type] [name]", vim.log.levels.ERROR)
			return
		end

		local generate_type = parts[1]
		local name = parts[2]

		if generate_type == "template" then
			-- Handle template generation
			local template_path = config.templates_dir .. "/" .. name .. ".template"
			vim.cmd("e " .. template_path)
		else
			vim.cmd("GrailsCommand generate-" .. generate_type .. " " .. name)
		end
	end, {
		nargs = "+",
		complete = function()
			return { "controller", "domain", "service", "template" }
		end,
	})
end

return M
