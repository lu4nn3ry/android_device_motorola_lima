#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/lima

# Inherit from common device tree
$(call inherit-product, device/motorola/lima-common/common.mk)

# One Macro (lima) specific configurations
# TODO: Add only lima-specific configs after validation against lima_32
# Maintain separation - do not copy lima_32 configs blindly
