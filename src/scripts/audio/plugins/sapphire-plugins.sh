#!/bin/bash
set -e
mkdir -p /tmp/sapphire
cd /tmp/sapphire
rm -f /tmp/sapphire/*.tgz
wget -q --show-progress "$(curl -sSL https://api.github.com/repos/baconpaul/sapphire-plugins/releases | grep browser_download_url | grep download | grep linux | head -n1 | cut -d '"' -f4)"
tar -xzf "$(find . -maxdepth 1 -name '*.tgz' -print -quit)"
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name '*.clap' -exec cp -r '{}' "$HOME"/.clap/ \;