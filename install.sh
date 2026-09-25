#!/bin/bash
# WDBX Linux Installer
set -e

INSTALL_DIR="/opt/wdbx"
echo "Installing WDBX Engine to $INSTALL_DIR..."

if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo ./install.sh)"
  exit 1
fi

mkdir -p "$INSTALL_DIR"
cp -r wdbx_engine/dist/* "$INSTALL_DIR/"

# Create symlinks
ln -sf "$INSTALL_DIR/bin/wdbx" /usr/local/bin/wdbx
ln -sf "$INSTALL_DIR/bin/wdbx-init" /usr/local/bin/wdbx-init
ln -sf "$INSTALL_DIR/bin/wdbx-ctl" /usr/local/bin/wdbx-ctl

echo "Installation complete!"
echo "To initialize a database run: wdbx-init -D ~/wdbx_data"
