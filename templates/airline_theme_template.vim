" (CSNAME) theme for airline
let s:cc = colorscheme_midnight_common#(CSNAME)_colors#get()
let s:palette = colorscheme_midnight_common#airline_theme#gen_airline_theme(s:cc)
let g:airline#themes#(CSNAME)#palette = s:palette

