#!/bin/bash

# Function to check if the system is a laptop
is_laptop() {
    # Check for battery/power_supply (common on laptops)
    if [ -d /sys/class/power_supply/ ]; then
        for supply in /sys/class/power_supply/*; do
            if [ -e "$supply/type" ] && grep -qi "battery" "$supply/type"; then
                return 0
            fi
        done
    fi

    # Check DMI/sysfs indicators
    if [ -e /sys/class/dmi/id/chassis_type ]; then
        # Chassis types that typically indicate laptops:
        # 8 = Portable, 9 = Laptop, 10 = Notebook, 11 = Hand Held, 14 = Sub-Notebook
        read -r chassis_type </sys/class/dmi/id/chassis_type
        if [[ "$chassis_type" =~ ^(8|9|10|11|14)$ ]]; then
            return 0
        fi
    fi

    # Check product name for laptop indicators
    if [ -e /sys/class/dmi/id/product_name ] &&
        grep -qi -E "(notebook|laptop|ultrabook|thinkpad|ideapad|macbook|surface)" /sys/class/dmi/id/product_name; then
        return 0
    fi

    return 1
}

# Main script
if is_laptop; then
    info_message "✅ This system is a laptop. Installing TLP for better power management..."

    # Install TLP if not already installed
    if ! pacman -Qi tlp &>/dev/null; then
        paru -S --needed tlp --noconfirm >/dev/null 2>&1 || handle_error "Failed to install TLP with paru"
        if [ $? -eq 0 ]; then
            sudo systemctl enable tlp --now
        fi
    fi
else
    info_message "This system is a desktop PC. TLP installation skipped."
fi
