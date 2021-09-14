#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Inherit proprietary blobs
-include vendor/xiaomi/venus/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/star

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := star

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 201326592 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# A/B
AB_OTA_UPDATER := true
TW_INCLUDE_REPACKTOOLS := true

# Kernel
BOARD_KERNEL_CMDLINE := 
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/star
TARGET_KERNEL_CONFIG := star_defconfig

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

#COMMENT OUT THIS FOR DIRTY BOOT
# Bootloader https://github.com/Demon000/device_xiaomi_venus/blob/lineage-18.1/BoardConfig.mk
PRODUCT_PLATFORM := star
TARGET_BOOTLOADER_BOARD_NAME := star
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
# HIDL https://github.com/Demon000/device_xiaomi_venus/blob/lineage-18.1/BoardConfig.mk
ODM_MANIFEST_FILES := $(DEVICE_PATH)/manifest.xml
#STOP

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0


#Testing
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true


#TEST
# Crypto
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true


# TWRP Configuration
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_Y_OFFSET := 88
TW_H_OFFSET := -88
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_SCREEN_BLANK := true
PLATFORM_VERSION := 16.1.0
TW_HAS_EDL_MODE := true
TW_SUPPORT_INPUT_1_2_HAPTICS := true
