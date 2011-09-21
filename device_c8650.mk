$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_as_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/c8650/c8650-vendor.mk)

$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8650/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := huawei_c8650
PRODUCT_DEVICE := c8650
PRODUCT_MODEL := huawei_c8650
PRODUCT_LOCALES := zh_CN zh_TW en_US

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    libcamera \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt \

DISABLE_DEXPREOPT := false

# fstab
PRODUCT_COPY_FILES += \
    device/huawei/c8650/vold.fstab:system/etc/vold.fstab

# bluetooth
PRODUCT_COPY_FILES += \
    device/huawei/c8650/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# apns-conf.xml
PRODUCT_COPY_FILES += \
    device/huawei/c8650/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    device/huawei/c8650/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Init
PRODUCT_COPY_FILES += \
    device/huawei/c8650/init.huawei.rc:root/init.huawei.rc \
    device/huawei/c8650/init.rc:root/init.rc \
    device/huawei/c8650/init:root/init \
    device/huawei/c8650/ueventd.rc:root/ueventd.rc

# Audio
PRODUCT_COPY_FILES += \
    device/huawei/c8650/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/c8650/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt 

#Media profile
PRODUCT_COPY_FILES += \
    device/huawei/c8650/media_profiles.xml:system/etc/media_profiles.xml

# Wifi firmware
PRODUCT_COPY_FILES += \
    device/huawei/c8650/prebuild/wifi/dhd.ko:system/wifi/dhd.ko \
    device/huawei/c8650/prebuild/wifi/firmware.bin:system/wifi/firmware.bin \
    device/huawei/c8650/prebuild/wifi/firmware_apsta.bin:system/wifi/firmware_apsta.bin \
    device/huawei/c8650/prebuild/wifi/nvram.txt:system/wifi/nvram.txt \

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml


# C8800 uses mid-density artwork where available
PRODUCT_LOCALES += mdpi



PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.lcd_density=160 \
    ro.com.android.dataroaming=false


PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=46003
    ro.telephony.default_network=4
    ro.config.hwft_simrefresh=true
    ro.config.do_sdcard_upgrade=true
    ro.config.keyguardPlmnLocaled=true
    ro.config.hw_CplusW=true
    ro.config.hw_virtualsdcard=true
    ro.config.srs.equalizer=true
    ro.config.srs.default.type=1
    ro.config.hw_new_double_signal=1
    ro.config.hw_fast_dormancy=1
    ro.config.hw_camera_resize=true
    debug.sf.hw=0
    ro.config.hw_menu_unlockscreen=false
    ro.config.hw_allow_g_map=false
    ro.config.hw_voicerecord=true
    ro.config.hw_GSensorOptimize=true
    ro.opengles.version=131072
    ro.config.hw_proximity=true
    dalvik.vm.heapsize=32m
    ro.config.hw_opta=92
    ro.config.hw_optb=156
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \

# Don't put dexfiles in /cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# addon
$(call inherit-product-if-exists, addon/addon.mk)
# wifi
$(call inherit-product-if-exists, device/huawei/c8650/wifi/wifi.mk)
