-- General settings.
require('settings')
require('keybindings')

-- Plugin configurations.
require('plugins/indent-blankline')
require('plugins/dashboard-nvim')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/which-key-nvim')
require('plugins/toggleterm')
require('plugins/bufferline')
require('plugins/nvim-tree')
require('plugins/nvim-cmp')
require('plugins/lualine')
require('project_nvim').setup {
  show_hidden = true,
}
require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
}
require('telescope').load_extension('projects')
require('gitsigns').setup()
require('Comment').setup()
require('neogit').setup()
