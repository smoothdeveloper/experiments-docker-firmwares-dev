apt-get update -y --force-yes
apt-get install -y --force-yes make gcc binutils wget bzip2 ssh libdigest-md5-file-perl
mkdir -p /opt/artila-m508-dev/
tar -xvf ./M501-kernel-20100302.tar.gz -C /opt/artila-m508-dev  
tar -xvf ./arm-linux-3.3.2.tar.bz2 -C /opt/artila-m508-dev
cp -Rf /opt/artila-m508-dev/local3.3.2/. /usr/local
ln -s /opt/artila-m508-dev/linux-2.6.x/include/asm-arm /opt/artila-m508-dev/linux-2.6.x/include/asm
ln /opt/artila-m508-dev/linux-2.6.x/arch/arm/configs/m501_defconfig /opt/artila-m508-dev/linux-2.6.x/.config
echo "alias ls='ls --color=auto'" >> ~/.bashrc
echo 'export PS1="\[$(tput setaf 3)\]\u@\h:\w $ \[$(tput sgr0)\]"' >> ~/.bashrc
echo 'root:Docker!' | chpasswd
