# nvim-grails

A Neovim plugin for working with Grails: A powerful, Groovy-based web application framework for the JVM, built on top of Spring Boot.
This plugin is a work in progress, until an official release is made.

## Features

- Full LSP support for Grails projects
- GSP file syntax highlighting and formatting
- Grails command integration
- Project detection and configuration
- Code generation scaffolding
- Custom templates support

## Requirements

- Neovim 0.11+
- Java 11+
- [Grails 5.0.0+](https://grails.org/)
- [Groovy Language Server](https://github.com/GroovyLanguageServer/groovy-language-server)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
return {
  'theincompletedetective/nvim-grails',
  requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim'  -- For some utility functions
  }
}
```

## Configuration

```lua
require("nvim-grails").setup({
    lsp = {
      cmd = { 'java', '-jar', '/path/to/groovy-language-server-all.jar' }
    }
})
```
