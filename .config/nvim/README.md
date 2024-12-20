# My Neovim Configuration

This repository contains a Neovim configuration that utilizes `lazy.nvim` as the plugin manager. The configuration includes various plugins for enhanced functionality, such as a dashboard for recent projects, a file manager, language servers for TypeScript, Go, Rust, and Tailwind CSS IntelliSense, as well as autocompletion and fuzzy searching capabilities.

## Project Structure

```
my-nvim-config
├── init.lua
├── lua
│   ├── plugins
│   │   ├── lazy.lua
│   │   ├── dashboard.lua
│   │   ├── filemanager.lua
│   │   ├── lsp.lua
│   │   ├── autocompletion.lua
│   │   ├── fzf.lua
│   │   └── theme.lua
│   └── settings
│       ├── init.lua
│       └── keymaps.lua
└── README.md
```

## Installation

1. Clone this repository to your local machine.
2. Open Neovim and run `:PackerInstall` to install the plugins defined in `lazy.lua`.
3. Configure your language servers as needed in `lsp.lua`.

## Features

- **Dashboard**: Displays recent projects on startup.
- **File Manager**: Provides a sidebar for easy file navigation.
- **Language Servers**: Supports TypeScript, Go, Rust, and Tailwind CSS IntelliSense.
- **Autocompletion**: Integrated with LSP for enhanced coding experience.
- **Fuzzy Finder**: Quickly search and navigate files using fzf.
- **Custom Theme**: Personalize the appearance of Neovim.

## Usage

After installation, you can start using Neovim with the configured features. Refer to the individual plugin files for specific configurations and options. Customize key mappings in `keymaps.lua` to suit your workflow.

## Contributing

Feel free to submit issues or pull requests to improve this configuration.
