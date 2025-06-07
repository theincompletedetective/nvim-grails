local M = {}

function M.setup()
  local config = require("nvim-grails.config").config

  local lsp_available, lspconfig = pcall(require, "lspconfig")
  if not lsp_available then
    vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
    return
  end

  -- Setup Groovy LSP with Grails-specific enhancements
  vim.lsp.config(
    "groovyls",
    vim.tbl_extend("force", config.lsp, {
      on_attach = function(client, bufnr)
        -- Grails-specific keybindings
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

        -- Formatting for Grails files
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ async = true })
          end, bufopts)
        end
      end,
    })
  )

  -- Add Grails-specific file patterns
  vim.filetype.add({
    pattern = {
      ["grails-app/views/.*.gsp"] = "gsp",
      ["grails-app/.*/.*.groovy"] = "groovy",
    },
  })
end

return M
