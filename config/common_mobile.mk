# Inherit common mobile stuff
$(call inherit-product, vendor/aosp/config/common.mk)

# Apps
PRODUCT_PACKAGES += \
    Aperture

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
