#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lima_32

# Inherit from common
include device/motorola/lima-common/BoardConfigCommon.mk

# Device-specific BoardConfig for Moto G8 Play (lima_32)
# TODO: Fill values from stock firmware after validation
# - Partitions (from stock fstab/partitions)
# - Kernel cmdline/DTB
# - Verified properties
# - Recovery config if needed
TARGET_BOOTLOADER_BOARD_NAME := lima
# TARGET_KERNEL_CONFIG := lima_32_defconfig
# TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab  # only when file exists and validated
