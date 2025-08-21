#!/bin/bash
set -e
mkdir -p /tmp/tal
cd /tmp/tal
rm -f /tmp/magnetophon/*.zip
wget -q --show-progress https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip
wget -q --show-progress https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip
wget -q --show-progress https://tal-software.com/downloads/plugins/TAL-Chorus-LX_64_linux.zip
wget -q --show-progress https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip
unzip -oqq '*.zip'
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name '*.clap' -exec cp -r '{}' "$HOME"/.clap/ \;