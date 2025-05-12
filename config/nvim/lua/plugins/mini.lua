return {
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    local pairs = require 'mini.pairs'
    local surround = require 'mini.surround'
    local files = require 'mini.files'
    local tabline = require 'mini.tabline'

    files.setup {}
    statusline.setup { use_icons = true }
    pairs.setup {}
    surround.setup {}
    tabline.setup {}
  end
}
