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
    ripgrep spicetify-cli spotify ttf-jetbrains-mono-nerd fzf fisher eza udiskie
    mpc hyprlock libpulse librewolf grub-btrfs sof-firmware vesktop xdg-desktop-portal-gtk
    tealdeer cava fuse bluez fuse2 pokemon-colorscripts-git pavucontrol blueman
    noto-fonts-emoji hypridle pamixer otf-font-awesome xdg-desktop-portal-hyprland
    dunst waybar fish hyprshot xdg-desktop-portal-gtk neovim starship wl-clipboard
    polkit-kde-agent sddm kitty btop rofi-wayland hyprpaper hyprland bluez-utils
    flatpak qt5-wayland brightnessctl bat ttf-cascadia-code-nerd
)

# Backup and modify pacman configuration
info_message "Backing up and updating pacman configuration..."
sudo cp /etc/pacman.conf /etc/pacman.conf.bak || handle_error "Failed to backup pacman.conf"
sudo tee /etc/pacman.conf >/dev/null <<EOF || handle_error "Failed to update pacman.conf"
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
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com || handle_error "Failed to import key"
sudo pacman-key --lsign-key 3056513887B78AEB || handle_error "Failed to sign key"
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm || handle_error "Failed to install chaotic-keyring"
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm || handle_error "Failed to install chaotic-mirrorlist"
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf || handle_error "Failed to add chaotic-aur to pacman.conf"
success_message "Chaotic AUR repository added."

# Install packages
info_message "Installing packages..."
sudo pacman -Sy --needed "${pkglist[@]}" --noconfirm || handle_error "Failed to install packages"
success_message "Packages installed successfully."

# Configure Starship prompt
info_message "Configuring Starship prompt..."
starship preset nerd-font-symbols -o ~/.config/starship.toml || handle_error "Failed to configure Starship"

# Install fish plugins
info_message "Installing Fish plugins..."
fish -c 'fisher install jorgebucaran/autopair.fish' || handle_error "Failed to install autopair plugin"
fish -c 'fisher install patrickf1/fzf.fish' || handle_error "Failed to install fzf plugin"
fish -c 'fisher install meaningful-ooo/sponge' || handle_error "Failed to install sponge plugin"
fish -c 'fisher install fishingline/safe-rm' || handle_error "Failed to install safe-rm plugin"
success_message "Fish plugins installed."

# Enable services
info_message "Enabling services..."
sudo systemctl enable sddm || handle_error "Failed to enable SDDM"
sudo systemctl enable bluetooth || handle_error "Failed to enable Bluetooth"
success_message "Services enabled."

# Update tldr
info_message "Updating TLDR..."
tldr --update || handle_error "Failed to update TLDR"

# Configure Spicetify
info_message "Configuring Spicetify..."
spicetify config sidebar_config 0
spicetify config inject_css 1
spicetify config replace_colors 1
spicetify config custom_apps lyrics-plus
spicetify config custom_apps marketplace
spicetify config current_theme marketplace
success_message "Spicetify configured."

# Create directories
info_message "Creating directories..."
mkdir -p ~/Documents ~/Pictures ~/Images ~/Videos ~/Downloads || handle_error "Failed to create directories"
success_message "Directories created."

# Configure GRUB theme
info_message "Configuring GRUB theme..."
git clone https://github.com/catppuccin/grub.git >/dev/null 2>&1 || handle_error "Failed to clone GRUB theme"
sudo cp -r grub/src/catppuccin-macchiato-grub-theme /boot/themes || handle_error "Failed to copy GRUB theme"
echo GRUB_THEME="/boot/themes/catppuccin-macchiato-grub-theme/theme.txt" | sudo tee -a /etc/default/grub
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet nowatchdog mem_sleep_default=deep\"" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg >/dev/null 2>&1 || handle_error "Failed to update GRUB config"
rm -rf grub
success_message "GRUB theme configured."

# Configure SDDM theme
info_message "Configuring SDDM theme..."
curl -O https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip >/dev/null 2>&1 || handle_error "Failed to download SDDM theme"
sudo unzip catppuccin-macchiato.zip -d /usr/share/sddm/themes/ || handle_error "Failed to extract SDDM theme"
sudo tee /etc/sddm.conf <<EOF || handle_error "Failed to configure SDDM"
[Theme]
Current=catppuccin-macchiato
EOF
rm -f catppuccin-macchiato.zip
success_message "SDDM theme configured."

# Install Bibata cursor theme
info_message "Installing Bibata cursor theme..."
git clone https://aur.archlinux.org/bibata-cursor-theme-bin.git || handle_error "Failed to clone Bibata cursor theme"
cd bibata-cursor-theme-bin || handle_error "Failed to enter Bibata directory"
makepkg -si --noconfirm || handle_error "Failed to build Bibata cursor theme"
cd .. || handle_error "Failed to return to parent directory"
rm -rf bibata-cursor-theme-bin
success_message "Bibata cursor theme installed."

# Change default shell to Fish
info_message "Changing default shell to Fish..."
chsh -s /usr/bin/fish || handle_error "Failed to change user shell to Fish"
sudo chsh -s /usr/bin/fish || handle_error "Failed to change root shell to Fish"
success_message "Default shell changed to Fish."

# Clean up
info_message "Cleaning up..."
rm -f .local/share/fish/fish_history
success_message "Cleanup complete."

# Final message and reboot
success_message "Setup complete. Rebooting now..."
reboot
