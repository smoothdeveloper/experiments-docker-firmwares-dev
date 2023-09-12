docker run \
    -it \
    --mount type=bind,src="`PWD`/src",target=/root/src \
    -p 222:22 \
    artilam508dev \
    bash
