$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kmini3g/kmini3g-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/kmini3g/overlay

LOCAL_PATH := device/samsung/kmini3g
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#init files
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.ssr.sh \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    init.carrier.rc \
    init.target.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kmini3g
PRODUCT_DEVICE := kmini3g

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Inherit from msm8226-common
$(call inherit-product, device/samsung/kmini3g/msm8226.mk)
