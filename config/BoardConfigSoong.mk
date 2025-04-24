PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += customVarsPlugin

SOONG_CONFIG_customVarsPlugin :=

define addVar
  SOONG_CONFIG_customVarsPlugin += $(1)
  SOONG_CONFIG_customVarsPlugin_$(1) := $($1)
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += customGlobalVars
SOONG_CONFIG_customGlobalVars += \
    additional_gralloc_10_usage_bits \
    bootloader_message_offset \
    camera_override_format_from_reserved \
    target_init_vendor_lib \
    target_trust_usb_control_path \
    target_trust_usb_control_enable \
    target_trust_usb_control_disable

# Soong bool variables
SOONG_CONFIG_customGlobalVars_camera_override_format_from_reserved := $(TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED)

# Set default values
BOOTLOADER_MESSAGE_OFFSET ?= 0
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED ?= false
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_TRUST_USB_CONTROL_PATH ?= /proc/sys/kernel/deny_new_usb
TARGET_TRUST_USB_CONTROL_ENABLE ?= 1
TARGET_TRUST_USB_CONTROL_DISABLE ?= 0

# Soong value variables
SOONG_CONFIG_customGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_customGlobalVars_bootloader_message_offset := $(BOOTLOADER_MESSAGE_OFFSET)
SOONG_CONFIG_customGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_customGlobalVars_target_trust_usb_control_path := $(TARGET_TRUST_USB_CONTROL_PATH)
SOONG_CONFIG_customGlobalVars_target_trust_usb_control_enable := $(TARGET_TRUST_USB_CONTROL_ENABLE)
SOONG_CONFIG_customGlobalVars_target_trust_usb_control_disable := $(TARGET_TRUST_USB_CONTROL_DISABLE)

# Camera package name
ifneq ($(TARGET_CAMERA_PACKAGE_NAME),)
    $(call soong_config_set,camera,package_name,$(TARGET_CAMERA_PACKAGE_NAME))
endif

# libcameraservice extension
ifneq ($(TARGET_CAMERA_SERVICE_EXT_LIB),)
    $(call soong_config_set,libcameraservice,ext_lib,$(TARGET_CAMERA_SERVICE_EXT_LIB))
endif

# Lineage Health HAL
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH),)
    $(call soong_config_set,lineage_health,charging_control_charging_path,$(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_DEADLINE_PATH),)
    $(call soong_config_set,lineage_health,charging_control_deadline_path,$(TARGET_HEALTH_CHARGING_CONTROL_DEADLINE_PATH))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED),)
    $(call soong_config_set,lineage_health,charging_control_charging_enabled,$(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED),)
    $(call soong_config_set,lineage_health,charging_control_charging_disabled,$(TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS),)
    $(call soong_config_set,lineage_health,charging_control_supports_bypass,$(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_DEADLINE),)
    $(call soong_config_set,lineage_health,charging_control_supports_deadline,$(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_DEADLINE))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_LIMIT),)
    $(call soong_config_set,lineage_health,charging_control_supports_limit,$(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_LIMIT))
endif
ifneq ($(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_TOGGLE),)
    $(call soong_config_set,lineage_health,charging_control_supports_toggle,$(TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_TOGGLE))
endif

# Lineage PowerShare HAL
ifneq ($(TARGET_POWERSHARE_PATH),)
    $(call soong_config_set,lineage_powershare,powershare_path,$(TARGET_POWERSHARE_PATH))
endif
ifneq ($(TARGET_POWERSHARE_ENABLED),)
    $(call soong_config_set,lineage_powershare,powershare_enabled,$(TARGET_POWERSHARE_ENABLED))
endif
ifneq ($(TARGET_POWERSHARE_DISABLED),)
    $(call soong_config_set,lineage_powershare,powershare_disabled,$(TARGET_POWERSHARE_DISABLED))
endif

# Power HAL
ifneq ($(TARGET_POWER_LIBPERFMGR_MODE_EXTENSION_LIB),)
    $(call soong_config_set,power_libperfmgr,mode_extension_lib,$(TARGET_POWER_LIBPERFMGR_MODE_EXTENSION_LIB))
endif

# Surfaceflinger
ifneq ($(TARGET_SURFACEFLINGER_UDFPS_LIB),)
    $(call soong_config_set,surfaceflinger,udfps_lib,$(TARGET_SURFACEFLINGER_UDFPS_LIB))
endif
