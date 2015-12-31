#!/system/bin/sh

load=`getprop sys.wifi.on`
if [ "$load" == "1" ];then
	echo "loading ssv6051" > /dev/kmsg
    insmod /system/lib/ssv6051.ko
	sleep 3;
	busybox ifconfig wlan0 up
else
	echo "unloading ssv6051" > /dev/kmsg
	busybox ifconfig wlan0 down
	sleep 1;
	rmmod ssv6051
fi


