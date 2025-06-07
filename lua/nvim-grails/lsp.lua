local M = {}

function M.setup()
  local config = require("nvim-grails.config").config

  -- Check if LSP is available
  local lsp_available, _ = pcall(require, "lspconfig")

  if not lsp_available then
    vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
    return
  end

  -- Setup Groovy LSP
  vim.lsp.config("groovyls", config.lsp)

  -- Additional Grails-specific setup
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "groovy",
    callback = function()
      -- You can add Grails-specific keymaps or settings here
    end,
  })
end

return M
