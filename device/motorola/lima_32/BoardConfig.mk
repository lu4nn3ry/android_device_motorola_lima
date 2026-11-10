#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lima_32

# Inherit from common
include device/motorola/lima-common/BoardConfigCommon.mk

# Device-specific BoardConfig for Moto G8 Play (lima_32)
# Verified parameters extracted directly from official boot.img (QMDS30.47-33-5)
TARGET_BOOTLOADER_BOARD_NAME := lima

# Boot image configuration
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x15000000
BOARD_TAGS_OFFSET := 0x14000000
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_DTB_SIZE := 111400
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 buildvariant=user
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Partitions & Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/recovery.fstab
