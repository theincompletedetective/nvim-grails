-- GSP (Grails Server Pages) settings
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- GSP-specific keymaps
local bufnr = vim.api.nvim_get_current_buf()
local bufopts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set("n", "<leader>gf", "gg=G", bufopts) -- Format entire file
