#!/bin/bash
set -e
# shellcheck disable=SC2034
PPA='xtradeb/apps'
# shellcheck disable=SC1090
source <(curl -sSL https://github.com/estudio-debian/estudio-debian.github.io/raw/main/src/static/functions.sh)
add_ppa