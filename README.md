# Dotfiles

This repository contains my personal dotfiles and configurations, managed using GNU Stow.

![Desktop](/assets/screenshot.png)

## 📦 Packages

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Git](https://git-scm.com/)

---

- [Dunst](https://dunst-project.org/)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Hyprpaper](https://github.com/hyprwm/hyprpaper)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Neovim](https://neovim.io/)
- [Oh My Posh](https://ohmyposh.dev/)
- [Rofi](https://davedavenport.github.io/rofi/)
- [Zsh](https://www.zsh.org/)
- [Waybar](https://github.com/Alexays/Waybar)

## 🚀 Quick Setup

1. Install GNU Stow:

```bash
# On Arch Linux
sudo pacman -S stow
```

1. Clone this repository:

```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

1. Create symlinks using Stow:

```bash
stow .
```

## 📁 Structure

```
.
├── .config
│   ├── ags         - AGS (Aylur's GTK Shell) configuration
│   ├── cava        - Cava audio visualizer settings
│   ├── dunst       - Dunst notification daemon
│   ├── fastfetch   - Fastfetch system info
│   ├── hypr        - Hyprland window manager
│   ├── kitty       - Kitty terminal emulator
│   ├── nvim        - Neovim editor
│   ├── ohmyposh    - Oh My Posh shell promt
│   ├── rofi        - Rofi application launcher
│   ├── waybar      - Waybar status bar
│   └── wlogout     - Wlogout session manager
└── .zshrc          - Zsh shell configuration
```

## ⚙️ Management

This repository uses GNU Stow to manage dotfiles. When you run `stow .`, it creates symlinks from your home directory to the files in this repository, keeping everything organized and version-controlled.

## 🔄 Updates

To update configurations:

1. Make changes to files in the repository
2. Commit your changes
3. Run `stow .` to update symlinks if needed

## 📝 License

See the [LICENSE](LICENSE) file for details.
