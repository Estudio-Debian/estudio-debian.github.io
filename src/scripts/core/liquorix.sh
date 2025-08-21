#!/bin/bash
set -e
sudo clear
wget -q --show-progress -O- https://liquorix.net/install-liquorix.sh | sudo bash

# auto-cpufreq
# shellcheck disable=SC2034
ICON_ORIG='indicator-cpufreq'
# shellcheck disable=SC2034
ICON_REPL='auto-cpufreq'
# shellcheck disable=SC1090
source <(curl -sSL https://estudio-debian.github.io/dist/functions.sh)
local_papirus_icon
cd /tmp
rm -fr /tmp/auto-cpufreq
git clone https://github.com/AdnanHodzic/auto-cpufreq
cd auto-cpufreq
printf i|sudo ./auto-cpufreq-installer