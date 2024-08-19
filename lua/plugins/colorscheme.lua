return {
  'rmehri01/onenord.nvim',
  dependencies = {
    'nvim-lualine/lualine.nvim',
    "willothy/nvim-cokeline",
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },
  config = function()
    require('lualine').setup({
      event = "VeryLazy",
      options = {
        theme = "onenord"
      },
    })
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and get_hex('ColorColumn', 'bg')
              or get_hex('Normal', 'fg')
        end,
        bg = function(buffer)
          return
              buffer.is_focused
              and get_hex('Normal', 'fg')
              or get_hex('ColorColumn', 'bg')
        end,
      },
      components = {
        {
          text = function(buffer) return ' ' .. buffer.devicon.icon end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          underline = function(buffer)
            return buffer.is_hovered and not buffer.is_focused
          end
        },
        {
          text = '',
          on_click = function(_, _, _, _, buffer)
            buffer:delete()
          end
        },
        {
          text = ' ',
        }
      },
    })
    require('onenord').setup({
      theme = "dark",  -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      borders = true,  -- Split window borders
      fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "bold",
        functions = "bold",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false,       -- Disable setting the background color
        float_background = false, -- Disable setting the background color for floating windows
        cursorline = false,       -- Disable the cursorline
        eob_lines = true,         -- Hide the end-of-buffer lines
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_highlights = {}, -- Overwrite default highlight groups
      custom_colors = {},     -- Overwrite default colors
    })
  end
}
