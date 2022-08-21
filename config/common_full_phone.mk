# Inherit full common stuff
$(call inherit-product, vendor/aosp/config/common_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/aosp/config/telephony.mk)
