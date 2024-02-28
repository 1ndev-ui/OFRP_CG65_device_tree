#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs - 
# SDCard replacement functionality
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

LOCAL_PATH := device/vortex/CG65

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 33

PRODUCT_PLATFORM := mt6765
PRODUCT_BOARD := k65v1_64_bsp

# VIRTUAL A/B
ENABLE_VIRTUAL_AB := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    system \
    vendor \
    boot

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl-recovery \
    android.hardware.boot@1.0-impl-1.2-mtkimpl \
    android.hardware.boot@1.0-service \
    bootctrl \
    bootctrl.mt6765 \
    bootctrl.mt6765.recovery \
    android.hardware.fastboot@1.0-impl-mtk \
    android.hardware.fastboot@1.0-impl-mtk.recovery \
    fastbootd \
    android.hardware.health@2.0-impl-2.1 \
    android.hardware.health@2.0-impl-service \
    libgptutils \
    libz \
    libcutils \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client
