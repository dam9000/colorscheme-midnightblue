-- midnightteal theme for lualine

local cc = require('colorscheme_midnight_common.midnightteal_colors')
return require('colorscheme_midnight_common.lualine_theme').gen_lualine_theme(cc)

-- vim: ts=2 sts=2 sw=2 et
