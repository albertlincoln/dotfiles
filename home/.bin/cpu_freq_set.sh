for i in 0 1 2 3; do
	echo ondemand > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
	cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
done
