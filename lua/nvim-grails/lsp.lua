local M = {}

function M.setup()
  local config = require("nvim-grails.config").config
  local lsp_available, lspconfig = pcall(require, "lspconfig")

  if not lsp_available then
    vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
    return
  end

  -- Add Grails-specific file patterns
  vim.filetype.add({
    pattern = {
      ["grails-app/views/.*.gsp"] = "gsp",
      ["grails-app/.*/.*.groovy"] = "groovy",
    },
  })
end

return M
