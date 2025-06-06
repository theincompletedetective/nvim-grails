-- Grails-specific Groovy settings
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.commentstring = "// %s"

-- Grails-specific keymaps
local bufnr = vim.api.nvim_get_current_buf()
local bufopts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set("n", "<leader>gt", ":GrailsTest<CR>", bufopts)
vim.keymap.set("n", "<leader>gr", ":GrailsRunApp<CR>", bufopts)
vim.keymap.set("n", "<leader>gs", ":GrailsStopApp<CR>", bufopts)
