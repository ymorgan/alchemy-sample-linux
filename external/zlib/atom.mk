
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := zlib
LOCAL_DESCRIPTION := Compression library
LOCAL_CATEGORY_PATH := libs/compression

LOCAL_EXPORT_LDLIBS := -lz

LOCAL_AUTOTOOLS_VERSION := 1.2.8
LOCAL_AUTOTOOLS_ARCHIVE := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION).tar.xz
LOCAL_AUTOTOOLS_SUBDIR := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION)

ifeq ("$(TARGET_FORCE_STATIC)","1")
  ZLIB_MODE :=
else
  ZLIB_MODE := --shared
endif

# Not a real configure script, it does not support standard --host option,
# everything is done via environment. AR needs to be overriden as well to
# pass some flags. -fPIC is to be able to create a .so from the .a
define LOCAL_AUTOTOOLS_CMD_CONFIGURE
	$(Q) cd $(PRIVATE_SRC_DIR) && \
		$(AUTOTOOLS_CONFIGURE_ENV) \
		CFLAGS="$$CFLAGS -fPIC" \
		LDSHARED="$(TARGET_CC) -shared $(TARGET_AUTOTOOLS_DYN_LDFLAGS)" \
		./configure \
			--prefix="$(AUTOTOOLS_CONFIGURE_PREFIX)" \
			$(ZLIB_MODE)
endef

# Remove some installed files after clean
define LOCAL_AUTOTOOLS_CMD_POST_CLEAN
	$(Q) rm -f $(TARGET_OUT_STAGING)/usr/include/zlib.h
	$(Q) rm -f $(TARGET_OUT_STAGING)/usr/include/zconf.h
endef

include $(BUILD_AUTOTOOLS)
