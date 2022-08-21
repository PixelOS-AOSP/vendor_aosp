# Inherit full common Lineage stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aosp/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/aosp/config/telephony.mk)
