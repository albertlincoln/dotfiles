if [ -e /sys/bus/usb/devices/1-5/power/control ]; then
	echo "auto" > /sys/bus/usb/devices/1-5/power/control
fi

if [ -e /sys/module/snd_hda_intel/parameters/power_save ]; then
	echo "1" > /sys/module/snd_hda_intel/parameters/power_save
fi
