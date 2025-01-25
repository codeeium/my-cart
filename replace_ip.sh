#!/bin/bash

# Define the old and new IP address
OLD_IP="192.168.1.100"  # replace with the old IP address
NEW_IP="192.168.1.200"  # replace with the new IP address

# Define the paths to the config files
CONFIG_PATH1="/var/www/html/opencart/new_admin/config.php"
CONFIG_PATH2="/var/www/html/opencart/config.php"

# Function to replace the IP address in a file
replace_ip_in_file() {
    local file_path=$1
    local old_ip=$2
    local new_ip=$3

    # Check if the file exists
    if [ -f "$file_path" ]; then
        echo "Replacing IP address in $file_path..."
        sudo sed -i "s/$old_ip/$new_ip/g" "$file_path"
        echo "IP address replaced in $file_path."
    else
        echo "File $file_path does not exist."
    fi
}

# Replace IP in both config files
replace_ip_in_file "$CONFIG_PATH1" "$OLD_IP" "$NEW_IP"
replace_ip_in_file "$CONFIG_PATH2" "$OLD_IP" "$NEW_IP"
