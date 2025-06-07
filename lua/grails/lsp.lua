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

  local groovy_ls = mason_registry.get_package("groovy-language-server")
  local lsp_path = groovy_ls:get_install_path()
      .. "/server/build/install/groovy-language-server/bin/groovy-language-server"

  lspconfig.groovyls.setup({
    cmd = { lsp_path },
    root_dir = lspconfig.util.root_pattern("grails-app", ".git"),
    filetypes = { "groovy" },
    settings = {},
    on_attach = function(client, bufnr)
      -- Optional: buffer local mappings or diagnostic config
    end,
  })
end

return M
