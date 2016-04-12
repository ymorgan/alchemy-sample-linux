#!/bin/sh

set -e

TOP_DIR=$(cd $(dirname $0) && pwd -P)

if [ -z "${QEMU}" ]; then
	QEMU=qemu-system-arm
fi

RAM="16"

MACHINE=vexpress-a9
CPU=cortex-a9

KERNEL_IMAGE=${TOP_DIR}/out/arm/final/boot/zImage
KERNEL_CMDLINE="console=ttyAMA0 root=/dev/mmcblk0"
SD_OPTS="-sd ${TOP_DIR}/out/arm/linux-arm.ext4"

${QEMU} \
	-m ${RAM} \
	-machine ${MACHINE} \
	-cpu ${CPU} \
	-kernel ${KERNEL_IMAGE} \
	-append "${KERNEL_CMDLINE}" \
	${SD_OPTS} \
	-nographic
