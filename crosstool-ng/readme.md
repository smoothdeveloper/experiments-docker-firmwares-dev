
```
docker build -t crosstool-ng

cd crosstool-ng repository

docker run \
    -it \
    --mount type=bind,src="`PWD`",target=/root/crosstool-ng \
    crosstool-ng \
    bash
```