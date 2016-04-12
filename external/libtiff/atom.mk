LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libtiff
LOCAL_DESCRIPTION := TIFF (Tag Image File Format) library
LOCAL_CATEGORY_PATH := libs/graphics

LOCAL_AUTOTOOLS_VERSION := 4.0.6
LOCAL_AUTOTOOLS_ARCHIVE := tiff-$(LOCAL_AUTOTOOLS_VERSION).tar.gz
LOCAL_AUTOTOOLS_SUBDIR := tiff-$(LOCAL_AUTOTOOLS_VERSION)

LOCAL_LIBRARIES := zlib
LOCAL_EXPORT_LDLIBS := -ltiff

include $(BUILD_AUTOTOOLS)