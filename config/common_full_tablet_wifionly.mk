# Inherit mobile full common stuff
$(call inherit-product, vendor/aosp/config/common_mobile_full.mk)

# Inherit tablet common stuff
$(call inherit-product, vendor/aosp/config/tablet.mk)

$(call inherit-product, vendor/aosp/config/wifionly.mk)
