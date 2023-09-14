apt-get update -y --force-yes
apt-get install -y --force-yes \
  make patch \
  gcc g++ libgmp-dev libmpfr-dev libmpc-dev \
  binutils wget bzip2 ssh libdigest-md5-file-perl \
  xz-utils
mkdir -p /opt/artila-m508-dev/
tar -xvf ./M501-kernel-20100302.tar.gz -C /opt/artila-m508-dev  
tar -xvf ./arm-linux-3.3.2.tar.bz2 -C /opt/artila-m508-dev
cp -Rf /opt/artila-m508-dev/local3.3.2/. /usr/local
cd /opt/artila-m508-dev/linux-2.6.x/

# patch the Makefile for recent make >= 3.82
# https://stackoverflow.com/a/13945900/17049
# http://sourceware.org/bugzilla/show_bug.cgi?id=11873
patch < ~/patch/M501-kernel-20100302-linux-2.6.x-Makefile.patch

# make linux kernel modules that enable cross compiling kernel modules
make ARCH=arm CROSS_COMPILE=arm-linux- m501_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux- modules

echo "alias ls='ls --color=auto'" >> ~/.bashrc
echo 'export PS1="\[$(tput setaf 3)\]\u@\h:\w $ \[$(tput sgr0)\]"' >> ~/.bashrc
echo 'root:Docker!' | chpasswd
