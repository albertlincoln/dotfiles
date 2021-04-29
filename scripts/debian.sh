#!/bin/bash

sudo echo "all ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/all
sudo chmod 0644 /etc/sudoers.d/all


if [ -x /usr/bin/apt ]; then
    sudo add-apt-repository ppa:saiarcot895/chromium-dev

    touch /etc/apt/preferences.d/chromium
    mv /etc/apt/preferences.d/chromium /home/all/src/dotfiles/backups

    cat << 'EOF' >> /etc/apt/preferences.d/chromium
Package: *
Pin: release o=LP-PPA-saiarcot895-chromium-dev
Pin-Priority: 1002
EOF

    sudo apt install chromium-browser -y
fi
