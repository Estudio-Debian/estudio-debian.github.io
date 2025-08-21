#!/bin/bash
set -e
# shellcheck disable=SC2034
ICON_ORIG='obs'
# shellcheck disable=SC2034
ICON_REPL='obs-studio'
# shellcheck disable=SC1090
source <(curl -sSL https://github.com/Estudio-Debian/estudio-debian.github.io/raw/main/src/dist/functions.sh)
local_papirus_icon
printf 2|am -i --icons obs-studio