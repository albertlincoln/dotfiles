#!/bin/bash

sudo echo "all ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/all
sudo chmod 0644 /etc/sudoers.d/all
sudo add-apt-repository ppa:saiarcot895/chromium-dev
touch /etc/apt/preferences/chromium
mv /etc/apt/preferences/chromium /home/all/src/dotfiles/backups
cat << 'EOF' >> /etc/apt/preferences.d/chromium
Package: *
Pin: release o=LP-PPA-saiarcot895-chromium-dev
Pin-Priority: 1002
EOF

sudo apt install chromium-browser -y
