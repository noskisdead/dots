# Welcome to noskisdead's Hyprland Dotfiles!

This repository contains my personal **Hyprland** dotfiles. They are tailored for **Arch Linux**; however, they might work on other Arch-based distros as well.
![Home!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/home.png)
![Terminal!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/terminal.png)
### Disclaimer
These configurations are heavily inspired by, and in some cases directly borrowed from, other repositories.
A few that I remember are:
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
- [deathemonic/Cat-Dots](https://github.com/deathemonic/Cat-Dots) (Rofi config)
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
   sudo pacman -S --needed git
   git clone https://github.com/noskisdead/dots
   cd dots
   chmod +x setup.sh
   ./setup.sh
   ```
**Reboot to apply changes!**
**Note:** You might not be able to login, if it's the case, select Hyprland in the SDDM menu located in the down-right corner of your screen.

# To do
Find a way to install a zen browser theme to the dotfiles
