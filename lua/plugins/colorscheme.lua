return {
    {
    "folke/tokyonight.nvim",
    dependencies = {
        'nvim-lualine/lualine.nvim',
        'nvim-tree/nvim-web-devicons',
        'utilyre/barbecue.nvim',
        'SmiteshP/nvim-navic',
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd[[colorscheme tokyonight-storm]]
        require('lualine').setup({
                event = "VeryLazy",
                options = {
                    theme = "tokyonight"
                },
        })
        require('barbecue').setup {
            theme = 'tokyonight',
        }
        require("tokyonight").setup({
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                comments = { italic = true },
                keywords = { bold = true },
                functions = { bold = true },
                variables = {},
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            sidebars = {"qf", "help"},
            day_brightness = 0.3,
            hide_inactive_statusline = true,
            dim_inactive = true,
            lualine_bold = true,
        })

    end
    },
}
