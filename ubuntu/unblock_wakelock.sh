#!/system/bin/sh

wakelock=sns_periodic_wakelock

for i in 1 2 3 4 5; do
    sleep 1
    if grep $wakelock /proc/wakelocks > /dev/null 2>&1; then
        echo $wakelock > /sys/power/wake_unlock
        break
    fi
done

# The kernel has problems properly entering suspend
# so just keep the device up for now.

echo "keep_susp_alive" > /sys/power/wake_lock
#sleep 1
#echo "keep_susp_alive" > /sys/power/wake_unlock
