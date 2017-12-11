if [ -e /sys/bus/usb/devices/1-5/power/control ]; then
	sudo echo "auto" > /sys/bus/usb/devices/1-5/power/control
fi

if [ -e /sys/module/snd_hda_intel/parameters/power_save ]; then
	sudo echo "1" > /sys/module/snd_hda_intel/parameters/power_save
fi

if [ -e /proc/sys/kernel/nmi_watchdog ]; then
	sudo echo "0" > /proc/sys/kernel/nmi_watchdog
fi

#/proc/sys/vm/dirty_writeback_centisecs
