#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lima/lima

# Inherit from common
include device/motorola/lima/BoardConfigCommon.mk

# Device-specific BoardConfig for Motorola One Macro (lima)
# TODO: Validate differences from lima_32 - DO NOT assume identical config
# TARGET_KERNEL_CONFIG := lima_defconfig
TARGET_BOOTLOADER_BOARD_NAME := lima
