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

$(call inherit-product, device/sony/nozomi/full_nozomi.mk)

# Inherit EOS common stuff.
$(call inherit-product, vendor/eos/common.mk)

# Boot Animation
BOOTANIMATION_RESOLUTION := 720x1280


PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT26i_1257-5499 BUILD_FINGERPRINT=SEMC/LT26i_1257-5499/LT26i:4.0.4/6.1.A.2.50/zfd_zw:user/release-keys PRIVATE_BUILD_DESC="LT26i-user 4.0.4 6.1.A.2.50 zfd_zw test-keys"

PRODUCT_NAME := full_nozomi
PRODUCT_DEVICE := nozomi
