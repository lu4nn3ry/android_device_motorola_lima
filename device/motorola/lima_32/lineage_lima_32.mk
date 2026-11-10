#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/motorola/lima-common/common.mk)
$(call inherit-product, device/motorola/lima_32/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_lima_32
PRODUCT_DEVICE := lima_32
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G8 Play

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# TODO: Extract REAL values from stock firmware of your Moto G8 Play (lima_32)
# Do NOT use placeholders in final builds
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lima_32-user 10 QMDS30.47-33-5 XXXXXXXX release-keys"

BUILD_FINGERPRINT := motorola/lima_32/lima_32:10/QMDS30.47-33-5/XXXXXXXX:user/release-keys
