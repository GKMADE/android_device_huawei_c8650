#!/bin/sh
insmod /wifi/dhd.ko "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"
sleep 5
