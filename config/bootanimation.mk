# Bootanimation
ifeq ($(TARGET_SCREEN_WIDTH),1080)
     PRODUCT_COPY_FILES += vendor/aosp/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_SCREEN_WIDTH),1440)
     PRODUCT_COPY_FILES += vendor/aosp/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_SCREEN_WIDTH),720)
     PRODUCT_COPY_FILES += vendor/aosp/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_SCREEN_WIDTH),)
        $(warning "TARGET_SCREEN_WIDTH is undefined, assuming 1080p")
    else
        $(warning "Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += vendor/aosp/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
