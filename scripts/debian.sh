#!/bin/bash

check_packages() {
    PACKAGES_TO_INSTALL=""
    UNABLE_TO_INSTALL=""
    for PACKAGE in  ${@}; do
	echo $PACKAGE
    apt-cache show $PACKAGE 2>&1 | grep -v "No package found" > /dev/null
    if [ "$?" = "0" ]; then
        PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $PACKAGE"
    else
        UNABLE_TO_INSTALL="$UNABLE_TO_INSTALL $PACKAGE"
    fi
    done
    echo $PACKAGES_TO_INSTALL
    sudo apt-get install $PACKAGES_TO_INSTALL
}

check_packages \
    vim-addon-manager \
    vim-nox \
    vim-scripts \
    bash-completion \
    pass \
    iputils-ping \
    fdupes\



# only try to install these if acpid / Xorg are running
pgrep Xorg 2>&1 > /dev/null

if [  "$?" = "0" ]; then

    check_packages \
        seahorse-daemon\
        firmware-linux\
        intel-microcode\
        tuned\
        ntp\
        xfonts-terminus\
        xfonts-terminus-oblique\
        powertop\

else

    check_packages \
        keychain\

fi
