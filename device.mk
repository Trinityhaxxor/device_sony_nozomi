# Copyright (C) 2012 FXP (FreeXperia)
# Copyright (C) 2013 The Open SEMC Team
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the temporary definitions
$(call inherit-product, device/sony/nozomi/temporary.mk)

# Full language support
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)


DEVICE_PACKAGE_OVERLAYS += device/sony/nozomi/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Bootsplash
PRODUCT_COPY_FILES += \
   device/sony/nozomi/prebuilt/eos_logo.rle:root/logo.rle

# EGL config
PRODUCT_COPY_FILES += \
    device/sony/nozomi/config/egl.cfg:system/lib/egl/egl.cfg

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/sony/nozomi/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8660 \
    gralloc.msm8660 \
    copybit.msm8660

# QCOM Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    audio_policy.conf \
    libaudioutils

# QCOM Omx
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbluedroid \
    brcm_patchram_plus \
    bt_vendor.conf

# QCOM GPS
PRODUCT_PACKAGES += \
    gps.msm8660 \
    librpc

# QCOM Liblights
PRODUCT_PACKAGES += \
    lights.msm8660

# QCOM Power
PRODUCT_PACKAGES += \
    power.msm8660

# e2fsck binary
PRODUCT_PACKAGES += \
    e2fsck

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Sensors - Sony DASH
#PRODUCT_PACKAGES += \
#    sensors.default

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := nosdcard

# Configuration scripts
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/pre_hw_config.sh:system/etc/pre_hw_config.sh \
   $(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh

# Custom init / uevent
PRODUCT_COPY_FILES += \
    device/sony/nozomi/config/init.semc.rc:root/init.semc.rc \
    device/sony/nozomi/config/init.fixbt.sh:system/etc/init.fixbt.sh \
    device/sony/nozomi/config/ueventd.semc.rc:root/ueventd.semc.rc

# USB function switching
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/init.semc.usb.rc:root/init.semc.usb.rc

# USB Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/fstab.semc:root/fstab.semc

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
   $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml \
   $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/sony/nozomi/config/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/sony/nozomi/config/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device

# Post recovery script
PRODUCT_COPY_FILES += \
    device/sony/nozomi/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# CNE config
PRODUCT_COPY_FILES += \
   device/sony/nozomi/config/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
   device/sony/nozomi/config/UserPolicy.xml:system/etc/UserPolicy.xml

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    device/sony/nozomi/config/thermald-semc.conf:system/etc/thermald-semc.conf

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/clearpad.kl:system/usr/keylayout/clearpad.kl \
   $(LOCAL_PATH)/config/clearpad.idc:system/usr/idc/clearpad.idc \
   $(LOCAL_PATH)/config/fuji-keypad.kl:system/usr/keylayout/fuji-keypad.kl \
   $(LOCAL_PATH)/config/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
   $(LOCAL_PATH)/config/keypad-pmic-fuji.kl:system/usr/keylayout/keypad-pmic-fuji.kl \
   $(LOCAL_PATH)/config/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
   $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/nozomi/nozomi-vendor.mk)

# Wifi
BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Wifi calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/calibration:system/etc/wifi/calibration

# Flashlight configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg

# Sensor configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/sensors.conf:system/etc/sensors.conf

