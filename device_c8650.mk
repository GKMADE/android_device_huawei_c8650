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
    libOmxCore \
    libOmxVidEnc \
    dexpreopt \
    gps.c8650 \
    lights.c8650 \
    FM \

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/huawei/c8650/qwerty.kl:system/usr/keylayout/qwerty.kl

# fstab
PRODUCT_COPY_FILES += \
    device/huawei/c8650/vold.fstab:system/etc/vold.fstab

# enhanced.conf
PRODUCT_COPY_FILES += \
    device/huawei/c8650/enhanced.conf:system/etc/enhanced.conf

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
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES := \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density=160 \
    qemu.sf.lcd_density=160 \
    ro.com.android.dataroaming=false \


PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=0 \
    ro.opengles.version=131072 \
    dalvik.vm.heapsize=32m \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.cdma.home.operator.numeric=46003 \
    ro.telephony.default_network=4 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM \
    ro.cdma.voicemail.number=mine \
    ro.com.google.locationfeatures=1 \

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \

# Don't put dexfiles in /cache
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.telephony.call_ring.multiple=false

# addon
$(call inherit-product-if-exists, addon/addon.mk)
# wifi
$(call inherit-product-if-exists, device/huawei/c8650/wifi/wifi.mk)
