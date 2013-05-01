# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2013 RaymanFX / Team EOS
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

"""EOS AOSP releasetools for nozomi"""

import common
import os
import shutil

OPTIONS = common.OPTIONS
OPTIONS.sizehack = True

TARGET_DIR = os.getenv('OUT')

def ReplaceLine(self):
    edify = self.script
    for i in xrange(len(edify.script)):
        if 'mount("ext4", "EMMC", "/dev/block/mmcblk0p14", "/data");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/data");'

        elif 'unmount("/data");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "umount", "/data");'

        elif 'mount("ext4", "EMMC", "/dev/block/mmcblk0p12", "/system");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/system");'

        elif 'unmount("/system");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "umount", "/system");'

        elif 'ui_print("Formatting system...");' in edify.script[i]:
            edify.script[i] += '\nrun_program("/sbin/busybox", "mount", "/system");\ndelete_recursive("/system");'

        elif 'format("ext4", "EMMC", "/dev/block/mmcblk0p12", "0");' in edify.script[i]:
            edify.script[i] = ''

def WriteBootImage(self):
    edify = self.script
    edify.script.append(
        'package_extract_file("boot.img", "/dev/block/mmcblk0p3");' )

def FullOTA_Assertions(self):
       ReplaceLine(self)

       #Copy boot.img verbatim
       bootimage_path = os.path.join(TARGET_DIR, "boot.elf")
       prebuilt_dir = os.path.join(self.input_tmp, "BOOTABLE_IMAGES")
       prebuilt_path = os.path.join(prebuilt_dir, "boot.img")
       os.mkdir(prebuilt_dir)
       shutil.copyfile(bootimage_path, prebuilt_path)

       #Force writing of boot.img to /boot
       WriteBootImage(self)

def IncrementalOTA_Assertions(self):
       ReplaceLine(self)

       #Force writing of boot.img to /boot
       WriteBootImage(self)

