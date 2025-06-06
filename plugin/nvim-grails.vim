if exists('g:loaded_nvim_grails')
    finish
endif
let g:loaded_grails_nvim = 1

lua require('nvim-grails').setup()
