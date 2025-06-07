local M = {}

local function is_grails_project()
  return vim.fn.isdirectory("grails-app") == 1
end

local function run_cmd_in_terminal(cmd)
  vim.cmd("vsplit | terminal " .. cmd)
end

function M.run_app()
  if not is_grails_project() then
    vim.notify("Not a Grails project", vim.log.levels.ERROR)
    return
  end
  run_cmd_in_terminal("grails run-app")
end

function M.run_console()
  if not is_grails_project() then
    vim.notify("Not a Grails project", vim.log.levels.ERROR)
    return
  end
  run_cmd_in_terminal("grails console")
end

function M.run_tests(type)
  if not is_grails_project() then
    vim.notify("Not a Grails project", vim.log.levels.ERROR)
    return
  end
  run_cmd_in_terminal("grails test-app " .. (type or ""))
end

function M.create_commands()
  vim.api.nvim_create_user_command("GrailsRunApp", M.run_app, {})
  vim.api.nvim_create_user_command("GrailsConsole", M.run_console, {})
  vim.api.nvim_create_user_command("GrailsTest", function(opts)
    M.run_tests(opts.args)
  end, { nargs = "?" })
end

function M.setup()
  M.create_commands()
  require("grails.lsp").setup()
end

return M
