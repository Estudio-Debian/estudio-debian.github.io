#!/bin/bash
set -e
# shellcheck disable=SC2034
PPA='xtradeb/apps'
# shellcheck disable=SC1090
source <(curl -sSL https://github.com/Estudio-Debian/estudio-debian.github.io/raw/main/src/dist/functions.sh)
add_ppa