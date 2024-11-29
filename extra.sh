#!/usr/bin/env bash

# Define a mapping of display names to actual package names
declare -A program_map=(
    ["Tmux"]="tmux"
    ["Zellij"]="zellij"
    ["OpenVPN"]="openvpn"
    ["Node.js"]="nodejs"
    ["Emacs"]="emacs"
    ["Sublime Text"]="sublime-text-4"
    ["VSCodium"]="vscodium"
    ["JetBrains Toolbox"]="jetbrains-toolbox"
    ["Brave Browser"]="brave-bin"
    ["Spotify"]="spotify"
    ["Spicetify"]="spicetify-cli"
    ["Notion"]="notion"
    ["Github Desktop"]="github-desktop"
    ["Signal"]="signal-desktop"
    ["Zoom"]="zoom"
    ["Vesktop"]="vesktop"
    ["Telegram"]="telegram-desktop"
    ["Steam"]="steam"
    ["Lutris"]="lutris"
    ["Wine"]="wine"
    ["Lunar Client"]="lunar-client"
    ["Syncthing"]="syncthing"
    ["LocalSend"]="localsend"
    ["Bitwarden"]="bitwarden"
    ["1password"]="1password"
    ["KeePassXC"]="keepassxc"
    ["OBS Studio"]="obs-studio"
    ["Bottles"]="bottles"
    ["Balena Etcher"]="balena-etcher"
    ["Obsidian"]="obsidian"
    ["Doom Emacs"]="doom-emacs"
    ["Spacemacs"]="spacemacs"
)

# List of program names for fzf (display names)
program_names=("${!program_map[@]}")

# Display the list of available programs and allow multi-selection using fzf
selected_program_names=$(printf "%s\n" "${program_names[@]}" | fzf --multi --prompt="Select programs to install (use TAB to select multiple, ENTER to confirm): ")

# Check if any programs were selected
if [ -z "$selected_program_names" ]; then
    echo "No program selected. Exiting."
    exit 1
fi

# Check if both Doom Emacs and Spacemacs were selected
if [[ "$selected_program_names" =~ "Doom Emacs" ]] && [[ "$selected_program_names" =~ "Spacemacs" ]]; then
    echo "Error: You cannot install both Doom Emacs and Spacemacs at the same time. Please select only one."
    exit 1
fi

# Convert selected program names to actual package names using the map
selected_programs=""
for program_name in $selected_program_names; do
    # Add the package name to the selected programs, except for Doom Emacs and Spacemacs
    if [ "$program_name" != "Doom Emacs" ] && [ "$program_name" != "Spacemacs" ]; then
        selected_programs+="${program_map[$program_name]} "
    fi
done

# Clean up the input: remove leading/trailing spaces and eliminate duplicates
selected_programs=$(echo "$selected_programs" | tr -s ' ' | sed 's/[[:space:]]*$//')

# If no programs were selected for installation via pacman, skip pacman installation
if [ -z "$selected_programs" ]; then
    echo "No packages to install via pacman. Skipping pacman installation."
else
    # Confirm installation with the user
    echo "You selected the following programs for installation:"
    echo "$selected_programs"
    read -p "Do you want to proceed with installation? (y/n): " confirmation

    # Proceed only if the user confirms
    if [[ "$confirmation" =~ ^[Yy]$ ]]; then
        # Install the selected programs using pacman (excluding Doom Emacs and Spacemacs)
        echo "Installing the selected programs..."
        sudo pacman -S --needed --noconfirm $selected_programs
    else
        echo "Installation canceled. Exiting."
        exit 1
    fi
fi

# Special handling for Doom Emacs installation
if [[ "$selected_program_names" =~ "Doom Emacs" ]]; then
    echo "Installing Doom Emacs..."
    # Reset previous Emacs config
    rm -rf ~/.emacs.d/
    rm -rf ~/.config/emacs/
    rm -rf ~/.local/share/doom/

    # Clone Doom Emacs and run the installer
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install
    ~/.config/emacs/bin/doom sync

    # Add Doom Emacs bin to PATH (if using fish shell)
    fish_add_path ~/.config/emacs/bin

    echo "Doom Emacs installation complete!"
fi

# Special handling for Spacemacs installation
if [[ "$selected_program_names" =~ "Spacemacs" ]]; then
    echo "Installing Spacemacs..."

    # Reset previous Emacs config
    rm -rf ~/.emacs.d/
    rm -rf ~/.config/emacs/
    rm -rf ~/.local/share/doom/

    # Clone Spacemacs repository into ~/.emacs.d
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

    echo "Spacemacs installation complete!"
fi
