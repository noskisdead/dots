#!/usr/bin/env bash

# Define colors
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper function for error handling
function handle_error() {
    clear
    echo -e "${RED}Error: $1${NC}"
    exit 1
}

# Informational message function
function info_message() {
    echo -e "${BLUE}$1${NC}"
}

# Packages to be installed
pkglist=(
    pacman-contrib unzip wget ttf-jetbrains-mono-nerd ripgrep signal-desktop
    fisher eza udiskie hyprlock grub-btrfs npm ruby thunar pavucontrol qt6ct
    xdg-desktop-portal-gtk pokemon-colorscripts-git openssh kvantum vesktop
    noto-fonts-emoji hypridle pamixer otf-font-awesome zen-browser-bin
    xdg-desktop-portal-hyprland swaync waybar fish hyprshot fzf noto-fonts-cjk
    xdg-desktop-portal-gtk starship wl-clipboard-x11 wl-clipboard python-pip
    mpv feh polkit-kde-agent sddm kitty rofi-wayland swww spotify zellij
    zoxide hyprland qt5-wayland brightnessctl ttf-cascadia-code-nerd
    yazi neovim zen-browser-bin bat
)

# Clearing the terminal before starting the script
clear

# Backup and modify pacman configuration
info_message "Backing up and updating pacman configuration..."
# sudo cp -rb ~/.dots/config/etc/. /etc
sudo cp -rb ~/dots/config/etc/. /etc

# Add chaotic-aur repository
info_message "Adding Chaotic AUR repository..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com >/dev/null 2>&1 || handle_error "Failed to import key"
sudo pacman-key --lsign-key 3056513887B78AEB >/dev/null 2>&1 || handle_error "Failed to sign key"
sudo pacman -U --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm >/dev/null 2>&1 || handle_error "Failed to install chaotic-keyring"
sudo pacman -U --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm >/dev/null 2>&1 || handle_error "Failed to install chaotic-mirrorlist"
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf >/dev/null 2>&1 || handle_error "Failed to add chaotic-aur to pacman.conf"

# Install packages
info_message "Installing packages, this could take a lot of time..."
sudo pacman -Sy --needed "${pkglist[@]}" --noconfirm >/dev/null 2>&1 || handle_error "Failed to install packages"

# Enable services
info_message "Enabling services..."
sudo systemctl enable sddm >/dev/null 2>&1 || handle_error "Failed to enable SDDM"

# Create directories
info_message "Creating directories..."
mkdir -p ~/Pictures ~/Downloads || handle_error "Failed to create directories"

# Install fish plugins
info_message "Installing Fish config..."
fish -c 'fisher install catppuccin/fish jorgebucaran/autopair.fish patrickf1/fzf.fish fishingline/safe-rm' >/dev/null 2>&1 || handle_error "Failed to install fish plugins"
echo "y" | fish -c 'fish_config theme save "Catppuccin Macchiato"' >/dev/null 2>&1 || handle_error "Failed to change the fish theme"

# Configure BAT theme
info_message "Configuring BAT theme"
mkdir -p "$(bat --config-dir)/themes" || handle_error "Failed to make BAT's config directory"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme >/dev/null 2>&1 || handle_error "Failed to download the BAT config"
bat cache --build >/dev/null 2>&1 || handle_error "Failed to build BAT's cache"
echo '--theme="Catppuccin Macchiato"' >~/.config/bat/config

# Configure GRUB theme
info_message "Configuring GRUB theme..."
sudo mkdir -p /boot/themes/ >/dev/null 2>&1 || handle_error "Failed to make the /boot/themes/ directory"
git clone https://github.com/catppuccin/grub.git >/dev/null 2>&1 || handle_error "Failed to clone GRUB theme"
sudo cp -r grub/src/catppuccin-macchiato-grub-theme /boot/themes >/dev/null 2>&1 || handle_error "Failed to copy GRUB theme"
grep -q 'GRUB_THEME="/boot/themes/catppuccin-macchiato-grub-theme/theme.txt"' /etc/default/grub || echo -e 'GRUB_THEME="/boot/themes/catppuccin-macchiato-grub-theme/theme.txt"\nGRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nowatchdog mem_sleep_default=deep"\nGRUB_TIMEOUT=1' | sudo tee -a /etc/default/grub >/dev/null 2>&1 || handle_error "Failed to configure GRUB"
sudo grub-mkconfig -o /boot/grub/grub.cfg >/dev/null 2>&1 || handle_error "Failed to update GRUB config"
rm -rf grub

# Set Default apps
info_message "Configuring default apps"
xdg-mime default feh.desktop image/jpeg || handle_error "Failed to set Feh as the default image opener."
xdg-mime default yazi.desktop inode/directory || handle_error "Failed to set Yazi as the default file manager."
xdg-settings set default-web-browser zen-beta.desktop
# Configure SDDM theme
info_message "Configuring SDDM theme..."
wget -nc https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip >/dev/null 2>&1 || handle_error "Failed to download SDDM theme"
echo "N" | sudo unzip catppuccin-macchiato.zip -d /usr/share/sddm/themes/ >/dev/null 2>&1 || handle_error "Failed to unzip the SDDM theme"
sudo tee /etc/sddm.conf >/dev/null 2>&1 <<EOF || handle_error "Failed to configure SDDM"
[Theme]
Current=catppuccin-macchiato
EOF
rm -f catppuccin-macchiato.zip

# Moving config files
info_message "Moving config files..."
sudo rm -rf ~/.zen/
sudo cp -r ~/dots/config/opt/. /opt/
# sudo cp -rb ~/.dots/config/opt/. /opt/
cp -r ~/dots/config/home/. ~/
# cp -r ~/.dots/config/home/. ~/
sudo git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git /usr/share/fonts/SFPro >/dev/null 2>&1 && sudo rm -rf /usr/share/fonts/SFPro/.git/ >/dev/null 2>&1 || handle_error "Failed to clone the SF Font"
fc-cache -f >/dev/null 2>&1 || handle_error "Failed to rebuild the font cache"

# Change default shell to Fish
info_message "Changing default shell to Fish.\nPlease enter your password..."
chsh -s "$(which fish)" >/dev/null 2>&1 || handle_error "Failed to change user shell to Fish"
sudo chsh -s "$(which fish)" >/dev/null 2>&1 || handle_error "Failed to change root shell to Fish"

# Clean up
info_message "Cleaning up..."
history -c
cd ..
mv ~/dots/ ~/.dots/

# Final message and reboot
clear
echo -e "Setup complete, the dots directory has been renamed to .dots!\nReboot the system to apply changes.\nYou can reboot the system by typing reboot or pressing the power button."
