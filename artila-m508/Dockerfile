FROM --platform=linux/i386 debian:latest

WORKDIR /root

COPY init.debian.sh /root/init.debian.sh
COPY M501-kernel-20100302.tar.gz /root/M501-kernel-20100302.tar.gz
COPY arm-linux-3.3.2.tar.bz2 /root/arm-linux-3.3.2.tar.bz2
COPY patch/M501-kernel-20100302-linux-2.6.x-Makefile.patch /root/patch/

RUN bash ./init.debian.sh

CMD bash