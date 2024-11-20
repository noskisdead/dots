#!/bin/bash

set -e # Exit immediately on error

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Handle errors by printing a message and exiting
handle_error() {
    echo "$1"
    exit 1
}

# Setup Pacman configuration file
setup_pacman_config() {
    echo "Setting up Pacman configuration..."
    sudo rm -f /etc/pacman.conf
    sudo tee /etc/pacman.conf >/dev/null <<EOF
[options]
HoldPkg = pacman glibc
Architecture = auto
SigLevel = Required DatabaseOptional
LocalFileSigLevel = Optional


# Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
#IgnorePkg   =
#IgnoreGroup =

#NoUpgrade   =
#NoExtract   =


#Misc Options
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
    clear
}

# Install necessary packages for the script to run
necessary() {
    echo "Installing necessary packages for the script to run"
    sudo pacman -Sy --needed git make unzip wget --noconfirm >/dev/null 2>&1
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key 3056513887B78AEB
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
    echo "" | sudo tee -a /etc/pacman.conf
    echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
    clear
}

# Install packages
install_packages() {
    echo "Installing packages..."
    sudo pacman -Sy --needed ripgrep spicetify-cli spotify ttf-jetbrains-mono-nerd fzf fisher eza udiskie mpc hyprlock libpulse librewolf grub-btrfs sof-firmware vesktop xdg-desktop-portal-gtk scdoc mailcap tealdeer cava fuse bluez fuse2 bmon pokemon-colorscripts-git pavucontrol blueman noto-fonts-emoji hypridle pamixer otf-font-awesome xdg-desktop-portal-hyprland dunst waybar fish hyprshot xdg-desktop-portal-gtk neovim starship wl-clipboard polkit-kde-agent slurp sddm kitty btop rofi-wayland hyprpaper hyprland bluez-utils flatpak qt5-wayland qt5-wayland brightnessctl bat grim ttf-cascadia-code-nerd --noconfirm
    starship preset nerd-font-symbols -o ~/.config/starship.toml
    fish -c 'fisher install jorgebucaran/autopair.fish'
    fish -c 'fisher install patrickf1/fzf.fish'
    fish -c 'fisher install meaningful-ooo/sponge'
    fish -c 'fisher install fishingline/safe-rm'
    sudo systemctl enable sddm
    tldr --update
    spicetify config sidebar_config 0
    spicetify config inject_css 1
    spicetify config replace_colors 1
    spicetify config custom_apps lyrics-plus
    spicetify config custom_apps marketplace
    spicetify config current_theme marketplace
    mkdir -p ~/Documents
    mkdir -p ~/Pictures
    mkdir -p ~/Images
    mkdir -p ~/Videos
    mkdir -p ~/Downloads
    clear
}

# Move dotfiles and configuration files
move_files() {
    echo "Moving configuration..."
    cp -r config/. ~/.config || handle_error "Failed to move configuration files."
    sudo mkdir -p /root/.config
    sudo mv ~/dots/config/nvim /root/.config
    clear
}

# Clone and set up GRUB theme
setup_grub_theme() {
    echo "Setting up GRUB theme..."
    sudo mkdir -p /boot/themes
    git clone https://github.com/catppuccin/grub.git >/dev/null 2>&1
    sudo cp -r grub/src/catppuccin-macchiato-grub-theme /boot/themes
    echo GRUB_THEME="/boot/themes/catppuccin-macchiato-grub-theme/theme.txt" | sudo tee -a /etc/default/grub
    echo "GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet nowatchdog mem_sleep_default=deep\"" | sudo tee -a /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg >/dev/null 2>&1
    rm -rf grub
    clear
}

# Download and set up SDDM theme and Cursor theme
setup_sddm_and_cursor_theme() {
    echo "Setting up SDDM theme..."
    wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-macchiato.zip >/dev/null 2>&1
    sudo unzip catppuccin-macchiato.zip -d /usr/share/sddm/themes/
    sudo tee /etc/sddm.conf <<EOF
[Theme]
Current=catppuccin-macchiato
EOF
    rm -f catppuccin-macchiato.zip
    clear
    git clone https://aur.archlinux.org/bibata-cursor-theme-bin.git
    cd bibata-cursor-theme-bin
    makepkg -si --noconfirm
    cd ..
    rm -rf bibata-cursor-theme-bin
    clear
}

# Main function
main() {
    setup_pacman_config
    move_files
    necessary
    install_packages
    setup_grub_theme
    setup_sddm_and_cursor_theme
    echo "Changing the default shell to fish (/usr/bin/fish)"
    chsh -s /usr/bin/fish
    sudo chsh -s /usr/bin/fish
    cd ..
    mv dots .dots
    clear
    echo "This folder has been renamed to .dots"
    echo "Script executed successfully. Reboot to apply any changes."
}

# Execute the main function
main
