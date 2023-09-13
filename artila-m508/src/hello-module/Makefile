ARCH=arm
CROSS_COMPILE=arm-linux-
MY_KERNEL_DIR=/opt/artila-m508-dev/linux-2.6.x/
#EXTRA_CFLAGS=-I/usr/local/arm-linux/sys-include
PWD=$(shell pwd)

obj-m += hello-module.o

all:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(MY_KERNEL_DIR) SUBDIRS=$(PWD) modules
clean:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(MY_KERNEL_DIR) SUBDIRS=$(PWD) clean
