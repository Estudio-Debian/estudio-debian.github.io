#!/bin/bash
set -e
# shellcheck disable=SC2034
ICON_ORIG='utilities-log-viewer'
# shellcheck disable=SC2034
ICON_REPL='rtcqs'
# shellcheck disable=SC2034
DEPS="pipx\
    python3-tk"
# shellcheck disable=SC1090
source <(curl -sSL https://github.com/Estudio-Debian/estudio-debian.github.io/raw/main/src/dist/functions.sh)
install_deb
local_papirus_icon
pipx install --force rtcqs
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -q --show-progress -O "$HOME"/.local/share/applications/rtcqs.desktop https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs.desktop
wget -q --show-progress -O "$HOME"/.local/share/icons/rtcqs.svg https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs_logo.svg