LOCAL_PATH := $(call my-dir)

# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)

LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_VENDOR_MODULE := true

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \
	libdl \
	libsync \
	libEGL \
	libnvgr \
	libnvos \
	libnvrm \
	libnvrm_graphics \
	libnvblit \
	libsync

LOCAL_STATIC_LIBRARIES := libnvfxmath

LOCAL_SRC_FILES := \
	nvgrmodule.c \
	nvgralloc.c \
	nvgrbuffer.c \
	nvgr_scratch.c \
	nvgr_2d.c \
	nvgr_egl.c \
	nvgr_props.c

LOCAL_CFLAGS += -DLOG_TAG=\"gralloc\"

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../include \
    hardware/nvidia/core/include

# This config can be used to reduce memory usage at the cost of performance.
ifeq ($(BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES),true)
    LOCAL_CFLAGS += -DNVGR_USE_TRIPLE_BUFFERING=0
else
    LOCAL_CFLAGS += -DNVGR_USE_TRIPLE_BUFFERING=1
endif

ifeq ($(BOARD_SUPPORT_MHL_CTS), 1)
    LOCAL_CFLAGS += -DSUPPORT_MHL_CTS=1
else
    LOCAL_CFLAGS += -DSUPPORT_MHL_CTS=0
endif

ifeq ($(BOARD_ENABLE_NV_ATRACE),true)
    LOCAL_CFLAGS += -DNV_ATRACE=1
endif

include $(BUILD_SHARED_LIBRARY)
