local M = {}

local default_config = {
  lsp = {
    cmd = { "groovy-language-server" },
    filetypes = { "groovy", "gsp" },
    root_markers = { "grails-app" },
    settings = {
      groovy = {
        classpath = {},
        gradle = {
          enabled = true,
        },
        grails = {
          enabled = true,
        },
      },
    },
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", default_config, opts or {})
end

return M
