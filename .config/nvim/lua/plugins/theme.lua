vim.opt.termguicolors = true
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = false
vim.cmd([[colorscheme poimandres]])

local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
    lualine.setup {
        options = {
            theme = 'poimandres',
            section_separators = '',
            component_separators = '',
        },
    }
end