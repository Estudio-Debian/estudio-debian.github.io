#!/bin/bash
set -e
BASENAME=''
LN=''
SWMC=''
TARGET="$()"
EXEC_OLD=''
EXEC_NEW=''
ICON_OLD=''
ICON_NEW=''
ICON_ORIG=''
ICON_REPL=''
DEPS=""
PPA=''
INSTNAME=''
BASENAME2=''
LN2=''
SWMC2=''
EXEC_OLD2=''
EXEC_NEW2=''
ICON_OLD2=''
ICON_NEW2=''
source <(curl -sSL https://github.com/estudio-debian/estudio-debian.github.io/raw/main/src/static/functions.sh)
enter_tmp
download
add_ppa
fix_launcher
local_papirus_icon
install_deb
if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
    COMANDO_UBUNTU
elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
    COMANDO_DEBIAN
fi