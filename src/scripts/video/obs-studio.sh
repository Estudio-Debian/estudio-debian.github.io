#!/bin/bash
set -e
# shellcheck disable=SC2034
PPA='obsproject/obs-studio'
# shellcheck disable=SC2034
INSTNAME='obs-studio --no-install-recommends'
# shellcheck disable=SC1090
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
    add_ppa
    install_deb
elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
    install_deb
fi