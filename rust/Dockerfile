FROM debian:latest

RUN apt-get update
RUN apt-get install -y gcc libc6-dev wget curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# work around https://github.com/rust-lang/rustup/issues/3544
RUN <<EOF
case "`arch`" in
  x86_64)
    rustup default stable-i686-unknown-linux-gnu
esac
EOF

CMD bash