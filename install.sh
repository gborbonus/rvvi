#!/bin/bash

# Install locations
BIN_DIR="/usr/local/bin"
CONFIG_DIR="/etc/default"
BACKUP_DIR="/var/rvvi_backup"

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (e.g., with sudo)"
    exit 1
fi

# Install vvi
cp vvi "$BIN_DIR/vvi" || { echo "Failed to install vvi"; exit 1; }
chmod +x "$BIN_DIR/vvi"
echo "Installed vvi to $BIN_DIR/vvi"

# Install rvi
cp rvi "$BIN_DIR/rvi" || { echo "Failed to install rvi"; exit 1; }
chmod +x "$BIN_DIR/rvi"
echo "Installed rvi to $BIN_DIR/rvi"

# Create backup directory
mkdir -p "$BACKUP_DIR" || { echo "Failed to create $BACKUP_DIR"; exit 1; }
chmod 700 "$BACKUP_DIR"
echo "Created backup directory $BACKUP_DIR"

# Install configuration file if it doesn't exist
if [ ! -f "$CONFIG_DIR/rvvi" ]; then
    cp rvvi "$CONFIG_DIR/rvvi" || { echo "Failed to install config file"; exit 1; }
    echo "Installed default config to $CONFIG_DIR/rvvi"
else
    echo "Config file $CONFIG_DIR/rvvi already exists; skipping"
fi

echo "Installation complete!"
echo "Run 'vvi --help' or 'rvi --help' for usage information."
