#!/bin/bash

set -e

TOP_DIR=$(cd $(dirname $0) && pwd -P)

TOOLCHAIN_URL="http://releases.linaro.org/14.09/components/toolchain/binaries"
TOOLCHAIN_FILE="gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.bz2"

LINUX_URL="https://www.kernel.org/pub/linux/kernel/v3.x"
LINUX_FILE="linux-3.18.30.tar.xz"

BUSYBOX_URL="http://www.busybox.net/downloads"
BUSYBOX_FILE="busybox-1.20.2.tar.bz2"

LIBPNG_URL="https://sourceforge.net/projects/libpng/files/libpng16/1.6.21"
LIBPNG_FILE="libpng-1.6.21.tar.gz"

TIFF_URL="http://download.osgeo.org/libtiff"
TIFF_FILE="tiff-4.0.6.tar.gz"

ZLIB_URL="http://downloads.sourceforge.net/project/libpng/zlib/1.2.8"
ZLIB_FILE="zlib-1.2.8.tar.xz"

if [ ! -d alchemy ]; then git clone https://github.com/Parrot-Developers/alchemy.git; fi

cd ${TOP_DIR}/toolchain
if [ ! -f ${TOOLCHAIN_FILE} ]; then wget ${TOOLCHAIN_URL}/${TOOLCHAIN_FILE}; fi
tar -C ${TOP_DIR}/toolchain -xf ${TOOLCHAIN_FILE}

cd ${TOP_DIR}/external/linux
if [ ! -f ${LINUX_FILE} ]; then wget ${LINUX_URL}/${LINUX_FILE}; fi
tar -C ${TOP_DIR}/external/linux -xf ${TOP_DIR}/external/linux/${LINUX_FILE}
cp ${TOP_DIR}/external/linux/linux.atom.mk ${TOP_DIR}/external/linux/linux-3.18.30/atom.mk

cd ${TOP_DIR}/external/libpng
if [ ! -f ${LIBPNG_FILE} ]; then wget ${LIBPNG_URL}/${LIBPNG_FILE}; fi

cd ${TOP_DIR}/external/libtiff
if [ ! -f ${TIFF_FILE} ]; then wget ${TIFF_URL}/${TIFF_FILE}; fi

cd ${TOP_DIR}/external/zlib
if [ ! -f ${ZLIB_FILE} ]; then wget ${ZLIB_URL}/${ZLIB_FILE}; fi

cd ${TOP_DIR}/external/busybox
if [ ! -f ${BUSYBOX_FILE} ]; then wget ${BUSYBOX_URL}/${BUSYBOX_FILE}; fi

