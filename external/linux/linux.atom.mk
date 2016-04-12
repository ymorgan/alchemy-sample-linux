
LOCAL_PATH := $(call my-dir)

ifeq ("$(TARGET_OS)","linux")
ifeq ("$(TARGET_OS_FLAVOUR)","generic")
include $(CLEAR_VARS)
LOCAL_MODULE := linux
LOCAL_CATEGORY_PATH := system
include $(BUILD_LINUX)
endif
endif
