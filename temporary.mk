# Copyright (C) 2013 RaymanFX (TeamEOS)
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

#
# These are temporary overrides that should be removed later
#

# Kernel and prebuilt recovery
PRODUCT_COPY_FILES += \
    device/sony/nozomi/temporary/kernel:kernel \
    device/sony/nozomi/temporary/ramdisk-recovery.cpio:ramdisk-recovery.cpio \
    device/sony/nozomi/temporary/ramdisk-recovery.img:ramdisk-recovery.img

# Bluetooth vendor library
PRODUCT_COPY_FILES += \
    device/sony/nozomi/temporary/bluetooth/libbt-vendor.so:system/vendor/lib/libbt-vendor.so