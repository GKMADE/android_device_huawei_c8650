#! /bin/sh
cd /system/wifi
ifconfig eth0 $1 up
wl join "$2"
sleep 3
