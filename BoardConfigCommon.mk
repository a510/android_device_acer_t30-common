TARGET_BOARD_PLATFORM := tegra

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 629145600
BOARD_CACHEIMAGE_PARTITION_SIZE := 1283457024
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29905387520
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
TARGET_RECOVERY_FSTAB := device/acer/t30-common/prebuilt/ramdisk/fstab.acer
TARGET_NO_SEPARATE_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CUSTOM_BOOTIMG_MK := device/acer/t30-common/custombootimg.mk
BOARD_CUSTOM_BOOTIMG := true
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true

# Include an expanded selection of fonts
# TODO: check available system space
# EXTENDED_FONT_FOOTPRINT := true

MALLOC_IMPL := dlmalloc

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Wi-Fi AP
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR := true

TARGET_KERNEL_SOURCE := kernel/acer/zt30

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_AUDIO_HW := true

BOARD_USES_GENERIC_INVENSENSE := false

-include vendor/acer/t30-common/BoardConfigVendor.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/acer/t30-common/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/acer/t30-common/prebuilt/etc/egl.cfg
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Sensors
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# OMX
# ADD_LEGACY_SET_POSITION_SYMBOL: libnvwinsys.so
# ADD_LEGACY_SURFACE_COMPOSER_CLIENT_SYMBOLS: libnvwinsys.so
# ADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL: libnvomxadaptor.so
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_SET_POSITION_SYMBOL -DADD_LEGACY_SURFACE_COMPOSER_CLIENT_SYMBOLS -DADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL

# Camera
USE_CAMERA_STUB := false

# Samsung EMMC brick bug
# Already disabled in kernel, but disable again for safety
BOARD_SUPPRESS_EMMC_WIPE := true

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.t30

# CMHW
BOARD_HARDWARE_CLASS := device/acer/t30-common/cmhw/

# updater-script
TARGET_RELEASETOOLS_EXTENSIONS := device/acer/t30-common

# Selinux
FORCE_PERMISSIVE_TO_UNCONFINED := false

# Compat
TARGET_USES_LOGD := false

BOARD_SEPOLICY_DIRS += \
	device/acer/t30-common/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts \
	genfs_contexts \
	app.te \
	bootanim.te \
	device.te \
	drmserver.te \
	file.te \
	lmkd.te \
	mediaserver.te \
	rild.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	ueventd.te
