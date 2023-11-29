" midnightgreen theme for airline
let s:cc = colorscheme_midnight_common#midnightgreen_colors#get()
let s:palette = colorscheme_midnight_common#airline_theme#gen_airline_theme(s:cc)
let g:airline#themes#midnightgreen#palette = s:palette

