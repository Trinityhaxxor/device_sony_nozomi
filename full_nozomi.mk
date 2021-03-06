# Copyright (C) 2013 RaymanFX
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
 
# Torch
#PRODUCT_PACKAGES := \
#    Torch

# Get the cyanogen list of APNs
PRODUCT_COPY_FILES += \
device/sony/nozomi/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
device/sony/nozomi/prebuilt/etc/spn-conf.xml:system/etc/spn-conf.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from nozomi device
$(call inherit-product, device/sony/nozomi/prebuilt/resources-xdpi.mk)

# Inherit from nozomi device
$(call inherit-product, device/sony/nozomi/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_nozomi
PRODUCT_DEVICE := nozomi
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia S

# Boot Animation
BOOTANIMATION_RESOLUTION := 720x1280

# Override EOS bootanimation
PRODUCT_COPY_FILES += \
device/sony/nozomi/prebuilt/bootanimation-mako.zip:system/media/bootanimation.zip

# Inherit EOS common stuff.
$(call inherit-product, vendor/eos/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT26i_1257-5499 BUILD_FINGERPRINT=SEMC/LT26i_1257-5499/LT26i:4.0.4/6.1.A.2.50/zfd_zw:user/release-keys PRIVATE_BUILD_DESC="LT26i-user 4.0.4 6.1.A.2.50 zfd_zw test-keys"
