PRODUCT_PACKAGES += \
    twrp

PRODUCT_COPY_FILES += \
    device/symphony/Z60_plus/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    device/symphony/Z60_plus/recovery.fstab:recovery/root/etc/recovery.fstab

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.soc.manufacturer=Spreadtrum \
    ro.soc.model=T616

TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
