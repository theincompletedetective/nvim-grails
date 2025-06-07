local M = {}

local home = vim.fn.expand("~")

local default_config = {
  lsp = {
    cmd = {
      "java",
      "-jar",
      home
      .. "/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
    },
    filetypes = { "groovy", "gsp" },
    root_dir = function(fname)
      local util = require("lspconfig.util")
      return util.root_pattern("grails-app", "grailsw")(fname)
    end,
    settings = {
      groovy = {
        classpath = {},
        gradle = {
          enabled = true,
          wrapper = { enabled = true },
        },
        grails = {
          enabled = true,
          autoDetect = true,
        },
        imports = {
          aliases = {
            ["grails.web"] = "org.grails.web",
            ["grails.gorm"] = "org.grails.datastore.gorm",
          },
        },
      },
    },
  },
  gsp = {
    enable_syntax = true,
    enable_ftplugin = true,
  },
  commands = {
    grails_executable = "./gradlew grails-run-command --args=",
  },
  scaffold = {
    templates_dir = vim.fn.stdpath("config") .. "/grails-templates",
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", default_config, opts or {})
end

return M
