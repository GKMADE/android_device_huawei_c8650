#!/bin/sh
insmod /wifi/dhd.ko "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"
sleep 5
cd /system/wifi/
chmod 744 udp_server
ifconfig eth0 192.168.1.3 up
wl join "U8220WIFITESTAP"
sleep 3
./udp_server
