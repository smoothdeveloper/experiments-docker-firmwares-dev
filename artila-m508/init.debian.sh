apt-get update -y

packages_to_install=(
    make
    bzip2
    patch
    gcc 
    # make linux kernel uses this
    libdigest-md5-file-perl

    # remote dev
    ssh
    gdb
    gdbserver
    cmake
    rsync

    # convenience
    file
)

apt-get install -y "${packages_to_install[@]}"
mkdir -p /opt/artila-m508-dev/

tar -xf ./M501-kernel-20100302.tar.gz -C /opt/artila-m508-dev  
tar -xf ./arm-linux-3.3.2.tar.bz2 -C /opt/artila-m508-dev
rm ./M501-kernel-20100302.tar.gz
rm ./arm-linux-3.3.2.tar.bz2

cp -Rf /opt/artila-m508-dev/local3.3.2/. /usr/local
cd /opt/artila-m508-dev/linux-2.6.x/

# patch the Makefile for recent make >= 3.82
# https://stackoverflow.com/a/13945900/17049
# http://sourceware.org/bugzilla/show_bug.cgi?id=11873
patch < ~/patch/M501-kernel-20100302-linux-2.6.x-Makefile.patch
rm ~/patch/M501-kernel-20100302-linux-2.6.x-Makefile.patch

# make linux kernel modules that enable cross compiling kernel modules
make ARCH=arm CROSS_COMPILE=arm-linux- m501_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux- modules

echo "alias ls='ls --color=auto'" >> ~/.bashrc
echo 'export PS1="\[$(tput setaf 3)\]\u@\h:\w $ \[$(tput sgr0)\]"' >> ~/.bashrc
echo 'root:Docker!' | chpasswd
