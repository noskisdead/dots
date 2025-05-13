# Welcome to NoSk's Hyprland Configuration!

> [!CAUTION]
> The install script assumes you have a **freshly installed Arch Linux** system with the following choices made during installation using **ArchInstall**:
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
- [deathemonic/Cat-Dots](https://github.com/deathemonic/Cat-Dots) - Rofi configuration
- [catppuccin/catppuccin](https://github.com/catppuccin/catppuccin) - Pretty much everything!
- [meowrch/meowrch](https://github.com/meowrch/meowrch) - Lotta things!
- [Klapptnot/low-battery-alert](https://github.com/Klapptnot/low-battery-alert) - Low battery alert (duh)

### Installation

If you are not connected via Ethernet, use the nmtui-connect CLI tool to connect to your WiFi network.

To install the configuration, follow these steps:
   ```
   sudo pacman -Sy --needed git base-devel
   git clone https://github.com/noskisdead/dots
   cd dots
   chmod +x install.sh
   ./install.sh
   ```
**Reboot to apply changes!**

### Programs
| Function         | Program          |
| :--------------- | :--------------- |
| Shell            | Fish             |
| Terminal         | Kitty            |
| CLI File Manager | Yazi             |
| GUI File Manager | Thunar           |
| Text Editor      | Neovim (LazyVim) |
| Note Editor      | Obsidian         |
| Web Browser      | Zen Browser      |
| Media Player     | mpv              |
| Image Viewer     | feh              |
| Archiver         | Ark              |

# Hyprland Keybindings
| Keys                                                                     | Action                                |
| :----------------------------------------------------------------------- | :------------------------------------ |
| <kbd>Super</kbd> + <kbd>Return</kbd>                                     | Launch the terminal                   |
| <kbd>Super</kbd> + <kbd>E</kbd>                                          | Launch the code editor (Neovim)       |
| <kbd>Super</kbd> + <kbd>F</kbd>                                          | Launch the file manager (Yazi)        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>                       | Launch the GUI file manager (Thunar)  |
| <kbd>Super</kbd> + <kbd>N</kbd>                                          | Show Notifications (SwayNC)           |
| <kbd>Super</kbd> + <kbd>A</kbd>                                          | Launch the web browser (Zen)          |
| <kbd>Super</kbd> + <kbd>Space</kbd>                                      | Launch Rofi (launcher)                |
| <kbd>Super</kbd> + <kbd>Q</kbd>                                          | Close focused window                  |
| <kbd>Alt</kbd> + <kbd>Space</kbd>                                        | Switch Keyboard Layouts               |
| <kbd>Super</kbd> + <kbd>Backspace</kbd>                                  | Launch the power menu                 |
| <kbd>Super</kbd> + <kbd>W</kbd>                                          | Toggle Waybar                         |
| <kbd>Super</kbd> + <kbd>G</kbd>                                          | Toggle Gamemode                       |
| <kbd>Super</kbd> + <kbd>V</kbd>                                          | Toggle floating window                |
| <kbd>Super</kbd> + <kbd>F11</kbd>                                        | Toggle fullscreen                     |
| <kbd>Super</kbd> + <kbd>P</kbd>                                          | Activate dwindle pseudo mode          |
| <kbd>Super</kbd> + <kbd>B</kbd>                                          | Toggle dwindle split mode             |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>                         | Take a screenshot                     |
| <kbd>Super</kbd> + <kbd>Arrows / Vim Directions</kbd>                    | Move focus to the selected direction  |
| <kbd>Super</kbd> + <kbd>1-10</kbd>                                       | Switch to workspace 1-10              |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-10</kbd>                    | Move active window to workspace 1-10  |
| <kbd>Super</kbd> + <kbd>S</kbd>                                          | Toggle special workspace              |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>                       | Move window to special workspace      |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Arrows / Vim Directions</kbd> | Resize active window                  |
| <kbd>Super</kbd> + <kbd>Mouse Left</kbd>                                 | Move window (drag)                    |
| <kbd>Super</kbd> + <kbd>Mouse Right</kbd>                                | Resize window (drag)                  |

### FAQWay

#### The Caps Lock and the Escape key are swapped!
By default, the **Caps Lock** key is swapped with the **Escape** key. To revert this change, open the `input.conf` file in the Hyprland configuration and remove the following line:
`, caps:swapescape`

#### Why does Obsidian ask me if I trust this vault?
When you first open **Obsidian**, a prompt will appear asking if you trust the vault. This is necessary for the **Catppuccin Macchiato** theme to work properly. Please accept the prompt to enable the theme.

#### What is the Stylus.json file in my **.config** directory?
The `Stylus.json` file in the **.dots directory** is a configuration file that contains the settings and preferences for **Stylus**, a browser extension. This file helps to import and update custom CSS themes, such as the **Catppuccin Macchiato** theme, for different websites.

To use the **Stylus** themes in **Zen**, follow these steps:
1. Open the **Stylus** configuration page.
2. Import the `Stylus.json` file from your home directory.
3. Once imported, click on the **"Check all styles for updates"** button.
4. Then, click on **"Apply all updates"** to apply the changes.

### To Do
- [ ] Make Zen Browser default
- [ ] try to make a spicetify iinstall script
- [ ] Better SDDM Theme
- [ ] Better battery alert
- [ ] Dark reader, proton pass
- [ ] Modify the README to include new binds
- [ ] make a nice github profile
