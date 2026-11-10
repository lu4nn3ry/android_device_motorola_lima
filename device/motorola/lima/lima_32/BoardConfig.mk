#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lima/lima_32

# Inherit from common
include device/motorola/lima/BoardConfigCommon.mk

# Device-specific BoardConfig for Moto G8 Play (lima_32)
# TODO: Fill values from stock firmware/BoardConfig references after validation
# - Partitions
# - Kernel cmdline/DTB
# - Display/audio configs
# - Fingerprint/etc
# - Verified properties
TARGET_BOOTLOADER_BOARD_NAME := lima
# TARGET_KERNEL_CONFIG := lima_32_defconfig
