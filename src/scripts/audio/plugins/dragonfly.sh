#!/bin/bash
set -e
# shellcheck disable=SC2034
INSTNAME='dragonfly-reverb-clap'
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/static/functions.sh)
install_deb