#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/lima_32

# Inherit from common device tree
$(call inherit-product, device/motorola/lima-common/common.mk)

# Lima_32 specific configurations (Moto G8 Play - PRIORITY)
# TODO: Add only lima_32-specific overlays, properties, packages after validation with stock firmware
