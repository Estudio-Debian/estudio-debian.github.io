#!/bin/bash
set -e
# shellcheck disable=SC2034
DEPS="cmake\
    g++\
    libpython3-dev\
    libqt5svg5-dev\
    libarchive-dev\
    libavcodec-dev\
    libavformat-dev\
    libavutil-dev\
    libpotrace-dev\
    libswscale-dev\
    qt5-image-formats-plugins\
    qtbase5-dev\
    qttools5-dev\
    zlib1g-dev"
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/dist/functions.sh)
enter_tmp
install_deb
git clone -q --recursive https://gitlab.com/mattbas/glaxnimate
cd glaxnimate
git submodule update --init --recursive
#if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
#    patch -p1 < $CAMINHO_DO_PATCH/glaxnimate.patch
#fi
mkdir build
cd build
cmake ..
make
make translations
sudo make install
cd /tmp
rm -fr /tmp/glaxnimate
printf '\nStartupWMClass=glaxnimate'|sudo tee -a /usr/local/share/applications/org.mattbas.Glaxnimate.desktop >/dev/null