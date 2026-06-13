LOCAL_PATH := $(call my-dir)

PRODUCT_NAME := twrp_Z60_plus
PRODUCT_DEVICE := Z60_plus
PRODUCT_BRAND := Symphony
PRODUCT_MODEL := Z60 plus
PRODUCT_MANUFACTURER := Symphony

$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.soc.manufacturer=Spreadtrum \
    ro.soc.model=T616 \
    ro.board.platform=ums9230 \
    ro.hardware=ums9230_1h10 \
    ro.product.device=Z60_plus \
    ro.build.product=Z60_plus \
    ro.twrp.boot=1 \
    ro.twrp.version=12.6

TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_FASTBOOTD := true
