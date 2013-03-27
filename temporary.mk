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

# Kernel
#PRODUCT_COPY_FILES += \
#    device/sony/nozomi/temporary/kernel:kernel

# Modules
#PRODUCT_COPY_FILES += \
#    device/sony/nozomi/temporary/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
#    device/sony/nozomi/temporary/modules/qce.ko:system/lib/modules/qce.ko \
#    device/sony/nozomi/temporary/modules/qcedev.ko:system/lib/modules/qcedev.ko \
#    device/sony/nozomi/temporary/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
#    device/sony/nozomi/temporary/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# Recovery
PRODUCT_COPY_FILES += \
    device/sony/nozomi/temporary/ramdisk-recovery.cpio:ramdisk-recovery.cpio \
    device/sony/nozomi/temporary/ramdisk-recovery.img:ramdisk-recovery.img
