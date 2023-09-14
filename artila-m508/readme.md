# Artila M-508 development environment

## pre-requisites

* docker
* wget

## setup the docker image

run ./local.prelude.sh to pull toolchain from artila.com

```bash
./local.prelude.sh
```

build the image

```bash
docker build . -t artilam508dev
```

## use the docker image

```bash
docker run \
    -it \
    --mount type=bind,src="`PWD`/src",target=/root/src \
    --mount type=bind,patch="`PWD`/src",target=/root/patch \
    -p 222:22 \
    artilam508dev \
    bash
```

## to ssh into the docker instance

start the ssh service
```bash
/etc/init.d/ssh start
```

on client
```bash
ssh -oHostKeyAlgorithms=+ssh-dss root@localhost -p 222
```

## interacting with artila M-508 device

### ssh into the device

```
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oHostKeyAlgorithms=+ssh-dss root@m508.device.ip
```

### copy file to the device
```
scp file.to.copy root@m508.device.ip:/home/guest/folder.to.copy.into
```
