# nvim-grails

A Neovim plugin for working with Grails: A powerful, Groovy-based web application framework for the JVM, built on top of Spring Boot.

## Features

- LSP support for Grails projects
- Groovy and GSP file support
- Code completion
- Navigation
- Diagnostics

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
