# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg

# Apps
PRODUCT_PACKAGES += \
    Aperture

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    Launcher3Go

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3Go
else
PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Themes
PRODUCT_PACKAGES += \
    LineageBlackTheme \
    LineageThemesStub \
    ThemePicker
