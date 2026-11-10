#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Common BoardConfig for Motorola Lima family
# NOTE: Do not share hardware configs without verifying compatibility between lima and lima_32
# Only add to common if proven identical for BOTH variants with documentation.

COMMON_PATH := device/motorola/lima-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lima
TARGET_NO_BOOTLOADER := true

# Platform (MediaTek Helio P70 / MT6771) - verify per build
TARGET_BOARD_PLATFORM := mt6771

# Kernel (to be configured per variant)
# TARGET_KERNEL_SOURCE := kernel/motorola/lima
# TARGET_KERNEL_CONFIG := <variant>_defconfig
# BOARD_KERNEL_CMDLINE := ...
# BOARD_KERNEL_BASE := ...
# BOARD_KERNEL_PAGESIZE := 2048
# BOARD_BOOTIMG_HEADER_VERSION := 2

# Partitions - MUST be verified from stock firmware/fstab per variant
# Do NOT assume values from common

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery - DO NOT set TARGET_RECOVERY_FSTAB here until validated
# Set per-variant with explicit path when recovery.fstab exists and is verified

# VNDK
BOARD_VNDK_VERSION := current

# Sepolicy - to be added as needed

# Avoid placing kernel/partition/recovery configs in common without evidence of identity.
