# Welcome to noskisdead's Hyprland Dotfiles!

This repository contains my personal **Hyprland** dotfiles. They are tailored for **Arch Linux**; however, they might work on other Arch-based distros as well.
![Home!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/home.png)
![Terminal!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/terminal.png)

### Disclaimer
These configurations are heavily inspired by, and in some cases directly borrowed from, other repositories.
A few that I remember are:
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
- [deathemonic/Cat-Dots](https://github.com/deathemonic/Cat-Dots) (Rofi configuration)
- [catppuccin/catppuccin](https://github.com/catppuccin/catppuccin) (Pretty much everything!)

## Requirements

This setup assumes you have a **freshly installed Arch Linux** system with the following choices made during installation using **archinstall**:

- **Disk Configuration:** BTRFS
- **Bootloader:** GRUB
- **Profile:** Minimal
- **Network configuration:** NetworkManager

## Installation

To install the configuration, follow these steps:

   ```
   sudo pacman -S --needed git base-devel
   git clone https://github.com/noskisdead/dots
   cd dots
   chmod +x setup.sh
   ./setup.sh
   ```
**Reboot to apply changes!**
**Note:** You might not be able to login, if it's the case, select Hyprland in the SDDM menu located in the down-right corner of your screen.

# Programs
| Function | Program |
| :--- | :--- |
| Shell | Fish |
| Terminal | Kitty |
| CLI File Manager | Yazi |
| GUI File Manager | Thunar |
| Text Editor | Neovim (LazyVim) |
| Web Browser | Zen Browser |
| Media Player | mpv |
| Image Viewer | feh |

# Keybindings
| Keys | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Return</kbd> | Launch the terminal |
| <kbd>Super</kbd> + <kbd>E</kbd> | Launch the web browser (Zen) |
| <kbd>Super</kbd> + <kbd>F</kbd> | Launch the file manager (Yazi) |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Close focused window |
| <kbd>Alt</kbd> + <kbd>F4</kbd> | Close focused window |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Launch Rofi (launcher) |
| <kbd>Super</kbd> + <kbd>Backspace</kbd> | Launch the power menu |
| <kbd>Super</kbd> + <kbd>W</kbd> | Toggle Waybar |
| <kbd>Super</kbd> + <kbd>V</kbd> | Toggle floating window |
| <kbd>Super</kbd> + <kbd>F11</kbd> | Toggle fullscreen |
| <kbd>Super</kbd> + <kbd>P</kbd> | Activate dwindle pseudo mode |
| <kbd>Super</kbd> + <kbd>J</kbd> | Toggle dwindle split mode |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Take a screenshot |
| <kbd>Super</kbd> + <kbd>Arrows</kbd> | Move focus to the selected direction |
| <kbd>Super</kbd> + <kbd>1-10</kbd> | Switch to workspace 1-10 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-10</kbd> | Move active window to workspace 1-10 |
| <kbd>Super</kbd> + <kbd>S</kbd> | Toggle special workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Move window to special workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Arrows</kbd> | Resize active window |
| <kbd>Super</kbd> + <kbd>Mouse Left</kbd> | Move window (drag) |
| <kbd>Super</kbd> + <kbd>Mouse Right</kbd> | Resize window (drag) |

# To do
Script to install the NVidia Drivers
