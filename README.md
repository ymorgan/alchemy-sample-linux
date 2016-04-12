
# Introduction

This is a simple example of a workspace to build a linux system for qemu arm
using alchemy. It contains linux kernel, busybox, a few external libraries
(zlib, libpng, libtiff) and some custom source code using them.

# Required host packages

You will need the folowing host packages in order to build this sample.

<pre>
$ sudo apt-get install build-essential wget git python pkg-config libncurses5 libncurses5-dev qemu-system-arm
</pre>

# Get toolchain/packages

<pre>
$ ./dl.sh
</pre>

This will download alchemy, the toolchain and some packages from the network.

# Build and generate the ext4 image

<pre>
$ ./build.sh all final image -j4
</pre>

This will build everything, generates the final rootfs and the ext4 image.
The -j4 option is the number of parallel jobs for the build (see make doc for
more information), adjust according to your environment.

# Configure the build

<pre>
$ ./build.sh menuconfig
</pre>

The config is stored in `config/arm/global.config`. If you add new packages in
the workspace they will be automatically detected and you will be able to
select them.

# Configure the kernel

<pre>
$ ./build.sh linux-menuconfig
</pre>

The config is stored in `config/arm/linux.config`.

# Configure busybox

<pre>
$ ./build.sh busybox-menuconfig
</pre>

The config is stored in `config/arm/busybox.config`.

# Clean

<pre>
$ ./build.sh clean
</pre>
or the more radical
<pre>
$ rm -rf out
</pre>

# Test with qemu

<pre>
$ ./qemu.sh
</pre>

This will launch qemu arm with the generated linux kernel and image. A busybox
shell should be launched on the console. To exit type `Ctrl-A x`

Troubleshooting: sometime the kernel fails to mount the image, restarting qemu
seems to make it work again.
<pre>
VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -6
</pre>
