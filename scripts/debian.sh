#!/bin/bash

check_packages() {
    PACKAGES_TO_INSTALL=""
    UNABLE_TO_INSTALL=""
    for PACKAGE in  ${@}; do
        apt-cache show $PACKAGE > /dev/null 2>&1
        if [ "$?" = "0" ]; then
            PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $PACKAGE"
        else
            UNABLE_TO_INSTALL="$UNABLE_TO_INSTALL $PACKAGE"
        fi
    done
    apt-get install $PACKAGES_TO_INSTALL
}

check_packages \
    vim-addon-manager \
    vim-nox \
    vim-scripts \
    bash-completion \
    pass \
    iputils-ping \
    fdupes\
    xfonts-terminus\
    xfonts-terminus-oblique\
    ntp\
    seahorse-daemon\
    firmware-linux\
    intel-microcode\
    tuned\
    powertop\
    tuned\
