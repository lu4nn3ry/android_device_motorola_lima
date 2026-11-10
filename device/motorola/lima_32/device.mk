#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/lima_32

# Inherit from common device tree
$(call inherit-product, device/motorola/lima-common/common.mk)

# Lima_32 specific configurations (Moto G8 Play - PRIORITY)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6771:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6771 \
    $(LOCAL_PATH)/rootdir/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab
