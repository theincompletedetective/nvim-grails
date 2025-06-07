local M = {}

local home = vim.fn.expand("~")

local default_config = {
  lsp = {
    cmd = { "java", "-jar", home .. "/.local/share/groovy/groovy-language-server-all.jar" },
    filetypes = { "groovy", "gsp" },
    root_dir = function(fname)
      -- Look for Grails project markers
      local util = require("lspconfig.util")
      return util.root_pattern("build.gradle", "grails-app", "gradle.properties")(fname)
    end,
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
