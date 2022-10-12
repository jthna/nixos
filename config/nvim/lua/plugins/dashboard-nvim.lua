local db = require('dashboard')

db.custom_header = {
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  'Hyperextensible Vim-based text editor',
  '',
}

db.custom_center = {
  {
    icon = '  ',
    desc = 'Browse directory                     ',
    action = ':NvimTreeOpen',
    shortcut = 'SPC o p',
  },
  {
    icon = '  ',
    desc = 'Open empty buffer                    ',
    action = ':DashboardNewFile',
    shortcut = 'SPC o e',
  },
  {
    icon = '  ',
    desc = 'Open project                         ',
    shortcut = 'SPC f p',
  },
  {
    icon = '  ',
    desc = 'Recently opened files                ',
    action = ':Telescope oldfiles',
    shortcut = 'SPC f r',
  },
  {
    icon = '  ',
    desc = 'Find file                            ',
    action = ':Telescope find_files',
    shortcut = 'SPC f f',
  },
  {
    icon = '  ',
    desc = 'Find word                            ',
    action = ':Telescope live_grep',
    shortcut = 'SPC f w',
  },
}
