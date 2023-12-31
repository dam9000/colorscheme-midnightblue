let s:cc = {}
let s:cc.bg_main          = #{ gui: '#081035', cterm: 234 }
let s:cc.bg0              = #{ gui: '#080a2a', cterm: 233 }
let s:cc.bg1              = #{ gui: '#081040', cterm: 17 }
let s:cc.bg2              = #{ gui: '#101838', cterm: 235 }
let s:cc.bg3              = #{ gui: '#182040', cterm: 236 }
let s:cc.bg4              = #{ gui: '#283050', cterm: 237 }
let s:cc.bg5              = #{ gui: '#384060', cterm: 60 }
let s:cc.black            = #{ gui: '#000000', cterm: 16 }
let s:cc.darkred          = #{ gui: '#800000', cterm: 88 }
let s:cc.darkgreen        = #{ gui: '#006400', cterm: 22 }
let s:cc.darkyellow       = #{ gui: '#808000', cterm: 100 }
let s:cc.darkblue         = #{ gui: '#000080', cterm: 18 }
let s:cc.purple           = #{ gui: '#800080', cterm: 90 }
let s:cc.darkcyan         = #{ gui: '#008080', cterm: 30 }
let s:cc.silver           = #{ gui: '#c0c0c0', cterm: 250 }
let s:cc.grey             = #{ gui: '#808080', cterm: 244 }
let s:cc.red              = #{ gui: '#ff0000', cterm: 196 }
let s:cc.green            = #{ gui: '#008000', cterm: 28 }
let s:cc.yellow           = #{ gui: '#ffff00', cterm: 226 }
let s:cc.blue             = #{ gui: '#0000ff', cterm: 21 }
let s:cc.magenta          = #{ gui: '#ff00ff', cterm: 201 }
let s:cc.cyan             = #{ gui: '#00ffff', cterm: 51 }
let s:cc.white            = #{ gui: '#eeeeee', cterm: 255 }
let s:cc.brightwhite      = #{ gui: '#ffffff', cterm: 231 }
let s:cc.brightyellow     = #{ gui: '#ffff64', cterm: 227 }
let s:cc.grey25           = #{ gui: '#404040', cterm: 238 }
let s:cc.grey32           = #{ gui: '#525252', cterm: 239 }
let s:cc.grey38           = #{ gui: '#616161', cterm: 241 }
let s:cc.grey44           = #{ gui: '#707070', cterm: 242 }
let s:cc.grey54           = #{ gui: '#8A8A8A', cterm: 245 }
let s:cc.deepskyblue      = #{ gui: '#00BFFF', cterm: 39 }
let s:cc.dodgerblue       = #{ gui: '#1E90FF', cterm: 33 }
let s:cc.mediumpurple2    = #{ gui: '#9F79EE', cterm: 141 }
let s:cc.violet           = #{ gui: '#EE82EE', cterm: 213 }
let s:cc.lightpink2       = #{ gui: '#EEA2AD', cterm: 217 }
let s:cc.orange           = #{ gui: '#FFA500', cterm: 214 }
let s:cc.burlywood        = #{ gui: '#DEB887', cterm: 180 }
let s:cc.limegreen        = #{ gui: '#32CD32', cterm: 40 }
let s:cc.aquamarine3      = #{ gui: '#66CDAA', cterm: 79 }
let s:cc.cadetblue2       = #{ gui: '#8EE5EE', cterm: 116 }
let s:cc.skyblue          = #{ gui: '#87CEEB', cterm: 117 }
let s:cc.diffadd          = #{ gui: '#104020', cterm: 22 }
let s:cc.diffchange       = #{ gui: '#204070', cterm: 25 }
let s:cc.diffdelete       = #{ gui: '#601020', cterm: 52 }
function! colorscheme_midnight_common#midnightblue_colors#get()
  return s:cc
endfunction
