ARCH?=arm
CROSS_COMPILE?=arm-linux-
MY_KERNEL_DIR?=/opt/artila-m508-dev/linux-2.6.x/
PWD=$(shell pwd)

obj-m += hello-module.o

all:
	make V=1 ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(MY_KERNEL_DIR) M=$(PWD) modules
clean:
	make V=1 ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(MY_KERNEL_DIR) M=$(PWD) clean
