#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lima

# Inherit from common
include device/motorola/lima-common/BoardConfigCommon.mk

# Device-specific BoardConfig for Motorola One Macro (lima)
# TODO: Validate differences from lima_32 - DO NOT assume identical config
# TARGET_KERNEL_CONFIG := lima_defconfig
TARGET_BOOTLOADER_BOARD_NAME := lima
# TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab  # only when validated
