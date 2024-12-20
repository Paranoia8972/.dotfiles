local dashboard = require('dashboard')

dashboard.setup {
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
           },
           shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        center = {
            { icon = '  ', desc = 'Recent Projects', action = 'Telescope oldfiles' },
            { icon = '  ', desc = 'Find File', action = 'Telescope find_files' },
            { icon = '  ', desc = 'File Browser', action = 'Telescope file_browser' },
            { icon = '  ', desc = 'Search Text', action = 'Telescope live_grep' },
        },
        footer = {
        },
    },
}