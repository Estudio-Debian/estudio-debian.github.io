#!/bin/bash
set -e
# shellcheck disable=SC2034
INSTNAME='synaptic'
# shellcheck disable=SC1090
source <(curl -sSL https://github.com/estudio-debian/estudio-debian.github.io/raw/main/src/static/functions.sh)
install_deb