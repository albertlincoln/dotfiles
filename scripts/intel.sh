cat /proc/cpuinfo  | grep -i intel 2>&1 > /dev/null

if [ "${?}" == "0" ]; then
    sudo apt-get -y install intel-microcode firmware-linux
fi
