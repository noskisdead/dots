# Welcome to noskisdead's Hyprland Configuration!
> [!CAUTION]
> The setup script assumes you have a **freshly installed Arch Linux** system with the following choices made during installation using **ArchInstall**:
> - **Disk Configuration:** BTRFS
> - **Bootloader:** GRUB
> - **Profile:** Minimal
> - **Sound Configuration:** PipeWire
> - **Network configuration:** NetworkManager
> - **Don't forget to set a password for disk encryption.**

### Screenshots
![Home!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/home.png)
![Terminal!](https://raw.githubusercontent.com/noskisdead/dots/refs/heads/master/assets/terminal.png)
### Disclaimer
These configurations are heavily inspired by, and in some cases directly borrowed from, other repositories.
A few that I remember are:
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
- [deathemonic/Cat-Dots](https://github.com/deathemonic/Cat-Dots) (Rofi configuration)
- [catppuccin/catppuccin](https://github.com/catppuccin/catppuccin) (Pretty much everything!)
- [Klapptnot/low-battery-alert](https://github.com/Klapptnot/low-battery-alert) (Pretty much everything!)

### Installation

If you are not connected via Ethernet, use the nmtui-connect CLI tool to connect to your WiFi network.

To install the configuration, follow these steps:
   ```
   sudo pacman -S --needed git base-devel
   git clone https://github.com/noskisdead/dots
   cd dots
   chmod +x setup.sh
   ./setup.sh
   ```
**Reboot to apply changes!**
> [!FAQ]
> **Note:** You might not be able to login, if it's the case, select Hyprland in the SDDM menu located in the bottom-middle corner of your screen.

> **Other important note:** the Caps Lock key is swapped with the escape key. You can revert this change by removing the ", caps:swapescape" in the input.conf file in the Hyprland dotfiles.

> **Final note lmfao:** Don't forget to execute `spicetify upgrade` after logging into Spotify

### Programs
| Function | Program |
| :--- | :--- |
| Shell | Fish |
| Terminal | Kitty |
| Multiplexer | Zellij |
| CLI File Manager | Yazi |
| GUI File Manager | Thunar |
| Text Editor | Neovim (LazyVim) |
| Web Browser | Zen Browser |
| Media Player | mpv |
| Image Viewer | feh |
| Archiver | Ark |

# Hyprland Keybindings
| Keys | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Return</kbd> | Launch the terminal |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Return</kbd>| Launch Zellij |
| <kbd>Super</kbd> + <kbd>E</kbd> | Launch the code editor (Neovim) |
| <kbd>Super</kbd> + <kbd>F</kbd> | Launch the file manager (Yazi) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> | Launch the GUI file manager (Thunar) |
| <kbd>Super</kbd> + <kbd>N</kbd> | Show Notifications (SwayNC) |
| <kbd>Super</kbd> + <kbd>A</kbd> | Launch the web browser (Zen) |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Launch Rofi (launcher) |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Close focused window |
| <kbd>Alt</kbd> + <kbd>Space</kbd> | Switch Keyboard Layout (You can set the second layout in the input.conf file in the hyprland config) |
| <kbd>Super</kbd> + <kbd>Backspace</kbd> | Launch the power menu |
| <kbd>Super</kbd> + <kbd>W</kbd> | Toggle Waybar |
| <kbd>Super</kbd> + <kbd>G</kbd> | Toggle Gamemode |
| <kbd>Super</kbd> + <kbd>V</kbd> | Toggle floating window |
| <kbd>Super</kbd> + <kbd>F11</kbd> | Toggle fullscreen |
| <kbd>Super</kbd> + <kbd>P</kbd> | Activate dwindle pseudo mode |
| <kbd>Super</kbd> + <kbd>B</kbd> | Toggle dwindle split mode |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Take a screenshot |
| <kbd>Super</kbd> + <kbd>Arrows / Vim Directions</kbd> | Move focus to the selected direction |
| <kbd>Super</kbd> + <kbd>1-10</kbd> | Switch to workspace 1-10 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-10</kbd> | Move active window to workspace 1-10 |
| <kbd>Super</kbd> + <kbd>S</kbd> | Toggle special workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Move window to special workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Arrows / Vim Directions</kbd> | Resize active window |
| <kbd>Super</kbd> + <kbd>Mouse Left</kbd> | Move window (drag) |
| <kbd>Super</kbd> + <kbd>Mouse Right</kbd> | Resize window (drag)

# To Do
Find a way to include the obsidian config in the dotfiles
