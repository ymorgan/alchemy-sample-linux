
TARGET_OS := linux
TARGET_OS_FLAVOUR := generic
TARGET_LIBC := eglibc

TARGET_ARCH := arm
TARGET_CPU := armv7a-neon
TARGET_FLOAT_ABI := hard

TARGET_CROSS := $(ALCHEMY_WORKSPACE_DIR)/toolchain/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-

TARGET_IMAGE_FORMAT := ext4
TARGET_IMAGE_OPTIONS := --size=32M

TARGET_SKEL_DIRS += $(TARGET_CONFIG_DIR)/skel
