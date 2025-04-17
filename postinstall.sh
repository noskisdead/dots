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
    spotify spicetify-cli spicetify-marketplace-bin
)

# Clearing the terminal before starting the script
clear

# Install packages
info_message "Installing packages, this could take a lot of time..."
sudo pacman -Sy --needed "${pkglist[@]}" --noconfirm >/dev/null 2>&1 || handle_error "Failed to install packages"

# Spicetify Configuration
info_message "Configuring Spicetify"
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify config custom_apps marketplace
spicetify config current_theme marketplace
spicetify config inject_css 1
spicetify config replace_colors 1
spicetify backup apply
spicetify apply
