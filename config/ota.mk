# Updater
ifeq ($(IS_OFFICIAL),true)
    PRODUCT_PACKAGES += \
        Updates

    PRODUCT_COPY_FILES += \
        vendor/aosp/prebuilt/common/etc/init/init.custom-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.custom-updater.rc
endif
