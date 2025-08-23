#!/bin/bash
set -e
if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
    printf 'Este repositório não é compatível com o Ubuntu'
elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
    printf 'deb https://www.deb-multimedia.org trixie main non-free' | sudo tee /etc/apt/sources.list.d/deb-multimedia.list
    sudo apt update -oAcquire::AllowInsecureRepositories=true 2>/dev/null
    sudo apt install -y --allow-unauthenticated deb-multimedia-keyring
    sudo apt update 2>/dev/null
    sudo apt dist-upgrade -y
fi