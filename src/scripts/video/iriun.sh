#!/bin/bash
set -e
# shellcheck disable=SC2034
TARGET="$(curl -sSLL https://iriun.com/ | grep deb | cut -d '"' -f4)"
# shellcheck disable=SC2034
ICON_ORIG='webcamoid'
# shellcheck disable=SC2034
ICON_REPL='iriunwebcam'
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/static/functions.sh)
enter_tmp
download
if grep -E "liquorix|xanmod" <(uname -r); then
    cd /tmp
    rm -fr /tmp/v4l2loopback*
    if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
        wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/"$(curl -sSL http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/ | grep -oP 'v4l2loopback-dkms_[^"]+?\.deb' | sort -V | tail -n1)"
        sudo apt install -y --reinstall ./v4l2loopback*.deb
    fi
#    git clone -q https://github.com/v4l2loopback/v4l2loopback
#    cd "$PWD"/v4l2loopback
#    make
#    sudo apt install -y --reinstall checkinstall
#    sudo checkinstall --pkgname=v4l2loopback --pkgversion="$(git describe --tags | sed 's/v//')" --backup=no --deldoc=yes --fstrans=no --default --provides=v4l2loopback-dkms
#    sudo depmod -a
#    sudo modprobe v4l2loopback
fi
local_papirus_icon
install_deb