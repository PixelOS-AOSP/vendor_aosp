# Inherit mobile full common stuff
$(call inherit-product, vendor/aosp/config/common_mobile_full.mk)

# Inherit full tablet common stuff
$(call inherit-product, vendor/aosp/config/full_tablet.mk)

$(call inherit-product, vendor/aosp/config/wifionly.mk)
