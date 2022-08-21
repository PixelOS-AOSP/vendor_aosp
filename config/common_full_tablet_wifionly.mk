# Inherit full common Lineage stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aosp/overlay/dictionaries
