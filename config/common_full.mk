# Inherit common stuff
$(call inherit-product, vendor/aosp/config/common_mobile.mk)

PRODUCT_SIZE := full

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd
