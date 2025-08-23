#!/bin/bash
set -e
if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
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
    source <(curl -sSL https://github.com/estudio-debian/estudio-debian.github.io/raw/main/src/static/functions.sh)
    enter_tmp
    install_deb
    git clone -q --recursive https://gitlab.com/mattbas/glaxnimate
    cd glaxnimate
    git submodule update --init --recursive
    mkdir build
    cd build
    cmake ..
    make
    make translations
    sudo make install
    cd /tmp
    rm -fr /tmp/glaxnimate
    printf '\nStartupWMClass=glaxnimate'|sudo tee -a /usr/local/share/applications/org.mattbas.Glaxnimate.desktop >/dev/null
elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
    # shellcheck disable=SC2034
    BASENAME='glaxnimate'
    # shellcheck disable=SC2034
    LN='org.mattbas.Glaxnimate'
    # shellcheck disable=SC2034
    SWMC='glaxnimate'
    # shellcheck disable=SC2034
    INSTNAME=glaxnimate
    # shellcheck disable=SC1090
    source <(curl -sSL https://github.com/estudio-debian/estudio-debian.github.io/raw/main/src/static/functions.sh)
    fix_launcher
    install_deb
fi