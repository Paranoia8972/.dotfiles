---@diagnostic disable: undefined-global
vim.opt.termguicolors = true

vim.g.custom_colors = {
    bg = "#00141D",
    fg = "#bfc4c6",
    cursor = "#bfc4c6",
    black = "#00141D",
    blue = "#269ACF",
    cyan = "#3A9FCC",
    blue_bright = "#29B5F5",
    blue_light = "#4FC3F7",
    blue_pale = "#6FCDF8",
    gray = "#89B3C7",
    white = "#bfc4c6",
    gray_dark = "#58666c",
}

-- Apply colors
vim.api.nvim_command('hi Normal guibg=' .. vim.g.custom_colors.bg .. ' guifg=' .. vim.g.custom_colors.fg)
vim.api.nvim_command('hi Cursor guibg=' .. vim.g.custom_colors.cursor)

-- Set up terminal colors
vim.g.terminal_color_0 = vim.g.custom_colors.black
vim.g.terminal_color_1 = vim.g.custom_colors.blue
vim.g.terminal_color_2 = vim.g.custom_colors.cyan
vim.g.terminal_color_3 = vim.g.custom_colors.blue_bright
vim.g.terminal_color_4 = vim.g.custom_colors.blue_light
vim.g.terminal_color_5 = vim.g.custom_colors.blue_pale
vim.g.terminal_color_6 = vim.g.custom_colors.gray
vim.g.terminal_color_7 = vim.g.custom_colors.white
vim.g.terminal_color_8 = vim.g.custom_colors.gray_dark
vim.g.terminal_color_9 = vim.g.custom_colors.blue
vim.g.terminal_color_10 = vim.g.custom_colors.cyan
vim.g.terminal_color_11 = vim.g.custom_colors.blue_bright
vim.g.terminal_color_12 = vim.g.custom_colors.blue_light
vim.g.terminal_color_13 = vim.g.custom_colors.blue_pale
vim.g.terminal_color_14 = vim.g.custom_colors.gray
vim.g.terminal_color_15 = vim.g.custom_colors.white

local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
    lualine.setup {
        options = {
            theme = {
                normal = {
                    a = { bg = vim.g.custom_colors.blue, fg = vim.g.custom_colors.black },
                    b = { bg = vim.g.custom_colors.gray_dark, fg = vim.g.custom_colors.white },
                    c = { bg = vim.g.custom_colors.black, fg = vim.g.custom_colors.white }
                }
            },
            section_separators = '',
            component_separators = '',
        },
    }
end



-- vim.opt.termguicolors = true
-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.g.gruvbox_invert_selection = false
-- vim.cmd([[colorscheme poimandres]])
-- 
-- local status_ok, lualine = pcall(require, 'lualine')
-- if status_ok then
--     lualine.setup {
--         options = {
--             theme = 'poimandres',
--             section_separators = '',
--             component_separators = '',
--         },
--     }
-- end