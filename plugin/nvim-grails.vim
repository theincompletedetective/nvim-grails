if exists('g:loaded_nvim_grails')
    finish
endif

let g:loaded_nvim_grails = 1

lua require('nvim-grails').setup()
