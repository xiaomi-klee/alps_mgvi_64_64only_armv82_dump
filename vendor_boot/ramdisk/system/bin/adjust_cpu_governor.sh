#!/system/bin/sh
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo walt > $cpu
    echo "$cpu: $(cat $cpu)"
done
