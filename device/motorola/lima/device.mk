#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common makefiles if they exist
$(call inherit-product-if-exists, $(LOCAL_PATH)/common/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
# PRODUCT_COPY_FILES += ...

# Audio, Display, etc. - add per validation
# Do not add hardware configs shared across variants without proof of compatibility
