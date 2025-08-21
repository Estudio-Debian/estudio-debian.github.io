#!/bin/bash
set -e
am -i --icons inkscape
sudo tee /usr/local/share/custom-launchers/inkscape >/dev/null <<EOF
sudo sed -i '/^\[Desktop Entry\]/a StartupWMClass=org.inkscape.Inkscape' /usr/local/share/applications/inkscape-AM.desktop
EOF
sudo bash /usr/local/share/custom-launchers/inkscape