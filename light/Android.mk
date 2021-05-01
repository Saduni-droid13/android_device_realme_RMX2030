LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.light@2.0-impl.RMX2030
LOCAL_MODULE_PATH_32 := $(TARGET_OUT)/lib
LOCAL_MODULE_PATH_64 := $(TARGET_OUT)/lib64
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_INSTALLED_MODULE_STEM := android.hardware.light@2.0-impl.so

LOCAL_SRC_FILES := Light.cpp

LOCAL_SHARED_LIBRARIES := \
        libbase \
        liblog \
        libhidlbase \
        libhidltransport \
        libhardware \
        libutils \
        android.hardware.light@2.0

include $(BUILD_SHARED_LIBRARY)
