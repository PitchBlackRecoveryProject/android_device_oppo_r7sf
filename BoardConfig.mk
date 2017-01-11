DEVICE_TREE := device/oppo/r7sf

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405
#TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Flags
#TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
#COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
#TARGET_KERNEL_SOURCE := kernel/oppo/msm8939
#TARGET_KERNEL_ARCH := arm64
#TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_CONFIG := twrp_defconfig
#TARGET_KERNEL_DEVICE_DEFCONFIG := device_r7sf

TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/kernel

# Boot image
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_TREE)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x80008000 --ramdisk_offset 0x81000000 --tags_offset 0x80000100 --dt device/oppo/r7sf/dt.img

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    #
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472    #
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26843545600 #
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728      #
BOARD_FLASH_BLOCK_SIZE := 131072                  # (BOARD_KERNEL_PAGESIZE * 64)
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 149
TW_SCREEN_BLANK_ON_BOOT := true

# TWRP Additional Flags
RECOVERY_VARIANT := twrp
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
# Remove USB Mass Storage capability
TW_NO_USB_STORAGE := true
#TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_DEFAULT_EXTERNAL_STORAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TW_INPUT_BLACKLIST := "lis3dh-accel\x0ahbtp_vm"
#TW_INPUT_BLACKLIST := "hbtp_vm"

# TWRP Overlay Graphics
TW_NEW_ION_HEAP := true
TW_TARGET_USES_QCOM_BSP := true
TARGET_SPECIFIC_HEADER_PATH := device/oppo/r7sf/include

# exFAT drivers included in the kernel?
TW_NO_EXFAT_FUSE := false

# No love for the wicked (device ships with M)
TW_EXCLUDE_SUPERSU := true

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Encryption support
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Debug flags
TWRP_INCLUDE_LOGCAT := false
# disabled due to 'logcat read failure'

# For TWRP Touchscreen Event Logging
TWRP_EVENT_LOGGING := false
# adb shell tail -f /tmp/recovery.log

# Time Zone data
PRODUCT_COPY_FILES += \
bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Additional alternative flags
#TW_USE_TOOLBOX := true
# don't take forever to wipe
#COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# USB Mounting for Mass Storage
# TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
