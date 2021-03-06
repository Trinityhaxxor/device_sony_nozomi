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

LOCAL_PATH := $(call my-dir)

# Recovery ramdisk (compressed and uncompressed)
recovery_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.img
recovery_uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.cpio

# Standard ramdisk (uncompressed)
uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

# Tools location
MKELF := device/sony/nozomi/tools/mkelf.py
INITSH := device/sony/nozomi/combinedroot/init.sh
BOOTREC_DEVICE := device/sony/nozomi/recovery/bootrec-device

# Create the combined boot image for two-stage boot
# (consists of kernel, ramdisk, recovery ramdisk (uncompressed))
SECONDARY_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/combined-boot.img
$(SECONDARY_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(uncompressed_ramdisk) $(recovery_uncompressed_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(INITSH) $(BOOTREC_DEVICE) $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/extract_elf_ramdisk $(MKBOOTIMG) $(MINIGZIP) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")

	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin

	$(hide) mv $(PRODUCT_OUT)/root/logo.rle $(PRODUCT_OUT)/combinedroot/logo.rle
	$(hide) cp $(uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/extract_elf_ramdisk $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) cp $(INITSH) $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) chmod 755 $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) ln -s sbin/init.sh $(PRODUCT_OUT)/combinedroot/init
	$(hide) cp $(BOOTREC_DEVICE) $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x40208000 $(PRODUCT_OUT)/combinedroot.fs@0x41500000,ramdisk vendor/sony/nozomi/proprietary/boot/RPM.bin@0x20000,rpm

# Hardlink the combined bootimage to a new file
# (will be used by AOSP releasetools or for fastboot)
	$(hide) ln -f $(SECONDARY_BOOTIMAGE_TARGET) $(PRODUCT_OUT)/boot.elf

# Create the recovery image
# (no real usage as of now)
SECONDARY_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery_nozomi.img
$(SECONDARY_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x40208000 $(PRODUCT_OUT)/ramdisk-recovery.img@0x41500000,ramdisk vendor/sony/nozomi/proprietary/boot/RPM.bin@0x20000,rpm
	@echo ----- Made recovery image -------- $@
#	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
