#!/bin/bash

# File: termux_banner.sh
# Purpose: Persistent Termux banner with username, date/time, network, uptime, and colors

# Function to get network status
get_network_status() {
    if ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
        # Check for Wi-Fi or mobile data interface
        if ip link show wlan0 >/dev/null 2>&1; then
            echo "Wi-Fi"
        elif ip link show rmnet_data0 >/dev/null 2>&1; then
            echo "Mobile Data"
        else
            echo "Online"
        fi
    else
        echo "No Network"
    fi
}

# Save banner name if not set
BANNER_NAME_FILE="$HOME/.banner_name"
if [ ! -f "$BANNER_NAME_FILE" ]; then
    read -rp "Enter your banner name: " banner_name
    echo "$banner_name" > "$BANNER_NAME_FILE"
else
    banner_name=$(cat "$BANNER_NAME_FILE")
fi

# Clear screen before showing banner
clear

# Show ASCII art banner using figlet if installed, otherwise simple text
if command -v figlet >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then
    figlet "$banner_name" | lolcat
elif command -v figlet >/dev/null 2>&1; then
    figlet "$banner_name"
else
    echo "=== $banner_name ==="
fi

# Show date and time
echo "Date: $(date '+%A, %d %B %Y | %I:%M %p')"

# Show network status
network_status=$(get_network_status)
echo "Network: $network_status"

# Show uptime
uptime_str=$(uptime -p)
echo "Uptime: $uptime_str"

# Colored separator line
echo -e "\e[32m========================================\e[0m"
