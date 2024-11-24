#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper function for error handling
function handle_error() {
    echo -e "${RED}Error: $1${NC}"
    exit 1
}

# Informational message function
function info_message() {
    echo -e "${BLUE}$1${NC}"
}

# Success message function
function success_message() {
    echo -e "${GREEN}$1${NC}"
}

# Packages to be installed
pkglist=(
    spicetify-marketplace-bin yazi spotify pacman-contrib spicetify-cli unzip wget ripgrep ttf-jetbrains-mono-nerd fzf fisher eza udiskie
    mpc hyprlock libpulse grub-btrfs sof-firmware xdg-desktop-portal-gtk
    tealdeer cava bluez pokemon-colorscripts-git pavucontrol blueman
    noto-fonts-emoji hypridle pamixer otf-font-awesome xdg-desktop-portal-hyprland
    dunst waybar fish hyprshot xdg-desktop-portal-gtk neovim starship wl-clipboard
    polkit-kde-agent sddm kitty rofi-wayland hyprpaper hyprland bluez-utils
    flatpak qt5-wayland brightnessctl bat ttf-cascadia-code-nerd
)

# Backup and modify pacman configuration
info_message "Backing up and updating pacman configuration..."
sudo cp /etc/pacman.conf /etc/pacman.conf.bak || handle_error "Failed to backup pacman.conf"
sudo tee /etc/pacman.conf >/dev/null 2>&1 <<EOF || handle_error "Failed to update pacman.conf"
[options]
HoldPkg = pacman glibc
Architecture = auto
SigLevel = Required DatabaseOptional
LocalFileSigLevel = Optional

ILoveCandy
Color
CheckSpace
VerbosePkgLists
ParallelDownloads = 5

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
success_message "Pacman configuration updated."

# Add chaotic-aur repository
info_message "Adding Chaotic AUR repository..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com >/dev/null 2>&1 || handle_error "Failed to import key"
sudo pacman-key --lsign-key 3056513887B78AEB >/dev/null 2>&1 || handle_error "Failed to sign key"
sudo pacman -U --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm >/dev/null 2>&1 || handle_error "Failed to install chaotic-keyring"
sudo pacman -U --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm >/dev/null 2>&1 || handle_error "Failed to install chaotic-mirrorlist"
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf >/dev/null 2>&1 || handle_error "Failed to add chaotic-aur to pacman.conf"
success_message "Chaotic AUR repository added."

# Install packages
info_message "Installing packages, this can take a lot of time..."
sudo pacman -Sy --needed "${pkglist[@]}" --noconfirm >/dev/null 2>&1 || handle_error "Failed to install packages"
success_message "Packages installed successfully."

# Configure BAT theme
info_message "Configuring BAT theme"
mkdir -p "$(bat --config-dir)/themes" || handle_error "Failed to make BAT's config directory"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme >/dev/null 2>&1 || handle_error "Failed to download the BAT config"
bat cache --build >/dev/null 2>&1 || handle_error "Failed to build BAT's cache"
echo '--theme="Catppuccin Macchiato"' >~/.config/bat/config
success_message "BAT configured successfully."

# Configure Starship prompt
info_message "Configuring Starship prompt..."
starship preset nerd-font-symbols -o ~/.config/starship.toml || handle_error "Failed to configure Starship"
success_message "Starship configured successfully"
# Install fish plugins
info_message "Installing Fish plugins..."
fish -c 'fisher install jorgebucaran/autopair.fish' >/dev/null 2>&1 || handle_error "Failed to install autopair plugin"
fish -c 'fisher install patrickf1/fzf.fish' >/dev/null 2>&1 || handle_error "Failed to install fzf plugin"
fish -c 'fisher install fishingline/safe-rm' >/dev/null 2>&1 || handle_error "Failed to install safe-rm plugin"
success_message "Fish plugins installed."

# Enable services
info_message "Enabling services..."
sudo systemctl enable sddm >/dev/null 2>&1 || handle_error "Failed to enable SDDM"
sudo systemctl enable bluetooth >/dev/null 2>&1 || handle_error "Failed to enable Bluetooth"
success_message "Services enabled."

# Update TLDR
info_message "Building the TLDR cache..."
tldr --update >/dev/null 2>&1 || handle_error "Failed to update TLDR"
success_message "TLDR cache built successfully"
# Create directories
info_message "Creating directories..."
mkdir -p ~/Documents ~/Pictures ~/Videos ~/Downloads || handle_error "Failed to create directories"
success_message "Directories created."

# Configure GRUB theme
info_message "Configuring GRUB theme..."
sudo mkdir -p /boot/themes/ >/dev/null 2>&1 || handle_error "Failed to make the /boot/themes/ directory"
git clone https://github.com/catppuccin/grub.git >/dev/null 2>&1 || handle_error "Failed to clone GRUB theme"
sudo cp -r grub/src/catppuccin-macchiato-grub-theme /boot/themes >/dev/null 2>&1 || handle_error "Failed to copy GRUB theme"
echo 'GRUB_THEME="/boot/themes/catppuccin-macchiato-grub-theme/theme.txt"' | sudo tee -a /etc/default/grub >/dev/null 2>&1
echo 'GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nowatchdog mem_sleep_default=deep"' | sudo tee -a /etc/default/grub >/dev/null 2>&1
sudo grub-mkconfig -o /boot/grub/grub.cfg >/dev/null 2>&1 || handle_error "Failed to update GRUB config"
rm -rf grub
success_message "GRUB theme configured."

# Configure Spicetify
info_message "Setting write permissions for Spotify"
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
success_message "Permissions changed successfully"

# Configure SDDM theme
info_message "Configuring SDDM theme..."
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip >/dev/null 2>&1 || handle_error "Failed to download SDDM theme"
sudo unzip catppuccin-macchiato.zip -d /usr/share/sddm/themes/ >/dev/null 2>&1 || handle_error "Failed to unzip the SDDM theme"
sudo tee /etc/sddm.conf >/dev/null 2>&1 <<EOF || handle_error "Failed to configure SDDM"
[Theme]
Current=catppuccin-macchiato
EOF
rm -f catppuccin-macchiato.zip
success_message "SDDM theme configured."

# Moving config files
cp -r config/. ~/.config/

# Install Bibata cursor theme
info_message "Installing Bibata cursor theme..."
git clone https://aur.archlinux.org/bibata-cursor-theme-bin.git >/dev/null 2>&1 || handle_error "Failed to clone Bibata cursor theme"
cd bibata-cursor-theme-bin || handle_error "Failed to enter Bibata directory"
makepkg -si --noconfirm >/dev/null 2>&1 || handle_error "Failed to build Bibata cursor theme"
cd .. || handle_error "Failed to return to parent directory"
rm -rf bibata-cursor-theme-bin >/dev/null 2>&1
success_message "Bibata cursor theme installed."

# Change default shell to Fish
info_message "Changing default shell to Fish..."
chsh -s /usr/bin/fish || handle_error "Failed to change user shell to Fish"
sudo chsh -s /usr/bin/fish || handle_error "Failed to change root shell to Fish"
success_message "Default shell changed to Fish."

# Clean up
info_message "Cleaning up..."
history -c
cd ..
mv dots/ .dots/
success_message "Cleanup complete."

# Final message and reboot
success_message "Setup complete. Rebooting now..."
reboot
