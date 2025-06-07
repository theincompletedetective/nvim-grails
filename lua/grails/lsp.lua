local M = {}

local function is_grails_project()
  return vim.fn.isdirectory("grails-app") == 1
end

function M.setup()
  if not is_grails_project() then
    return
  end

  local ok_mason, mason_registry = pcall(require, "mason-registry")

  if not ok_mason then
    return
  end

  if not mason_registry.is_installed("groovy-language-server") then
    vim.notify("Installing groovy-language-server via Mason...", vim.log.levels.INFO)
    mason_registry.get_package("groovy-language-server"):install()
  end

  local ok_lspconfig, lspconfig = pcall(require, "lspconfig")

  if not ok_lspconfig then
    return
  end

  vim.lsp.config("groovyls", {
    -- root_dir = lspconfig.util.root_pattern("grails-app"),
    filetypes = { "groovy", "gsp" },
    settings = {},
    on_attach = function(client, bufnr)
      -- Optional: buffer local mappings or diagnostic config
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  })
end

return M
