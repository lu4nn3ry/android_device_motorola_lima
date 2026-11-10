#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lima_32/lineage_lima_32.mk \
    $(LOCAL_DIR)/lima/lineage_lima.mk

COMMON_LUNCH_CHOICES := \
    lineage_lima_32-userdebug \
    lineage_lima_32-user \
    lineage_lima_32-eng \
    lineage_lima-userdebug \
    lineage_lima-user \
    lineage_lima-eng
