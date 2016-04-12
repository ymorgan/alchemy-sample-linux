
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libsample
LOCAL_CONFIG_FILES := libsample/Config.in
$(call load-config)
LOCAL_DESCRIPTION := Sample library
LOCAL_SRC_FILES := libsample/libsample.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libsample
LOCAL_LIBRARIES := libpng libtiff
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := myprog
LOCAL_DESCRIPTION := Sample program
LOCAL_SRC_FILES := myprog/myprog.c
LOCAL_LIBRARIES := libsample
include $(BUILD_EXECUTABLE)
