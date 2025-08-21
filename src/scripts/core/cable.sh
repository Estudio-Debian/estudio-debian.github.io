#!/bin/bash
set -e
# shellcheck disable=SC2034
TARGET="$(curl -sSL https://api.github.com/repos/magillos/Cable/releases | grep browser_download_url | grep deb | head -n1 | cut -d '"' -f4)"
# shellcheck disable=SC2034
ICON_ORIG='laditools'
# shellcheck disable=SC2034
ICON_REPL='jack-plug'
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/dist/functions.sh)
enter_tmp
download
local_papirus_icon
install_deb
mkdir -p "$HOME"/.config/cable
tee "$HOME"/.config/cable/config.ini >/dev/null <<EOF
[DEFAULT]
tray_enabled = True
EOF
mkdir -p "$HOME"/.local/share/applications
tee "$HOME"/.local/share/applications/cables.desktop >/dev/null <<EOF
[Desktop Entry]
Name=Cables
Exec=pw-jack cable %u
Icon=jack-plug
Terminal=false
Type=Application
StartupWMClass=connection-manager.py
NoDisplay=true
EOF