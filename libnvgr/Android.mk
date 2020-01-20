LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := nvgr.c
LOCAL_MODULE := libnvgr

LOCAL_SHARED_LIBRARIES := \
	libhardware \
	libcutils \
        liblog \
	libsync

LOCAL_CFLAGS += -DLOG_TAG=\"nvgrapi\"

LOCAL_C_INCLUDES := \
    hardware/nvidia/core-headers \
    $(LOCAL_PATH)/../gralloc \
    $(LOCAL_PATH)/../include

include $(BUILD_SHARED_LIBRARY)
