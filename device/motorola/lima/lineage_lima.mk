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
$(call inherit-product, device/motorola/lima/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_lima
PRODUCT_DEVICE := lima
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Motorola One Macro

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# TODO: Extract REAL values from stock firmware of your Motorola One Macro (lima)
# Do NOT use placeholders in final builds
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lima-user 10 XXXXXXXXXXX release-keys"

BUILD_FINGERPRINT := motorola/lima/lima:10/XXXXXXXXXXX/XXXXXXXX:user/release-keys
