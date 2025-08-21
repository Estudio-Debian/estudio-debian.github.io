#!/bin/bash
set -e
# shellcheck disable=SC2034
PPA='xtradeb/apps'
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/dist/functions.sh)
add_ppa