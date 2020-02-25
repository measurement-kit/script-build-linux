FROM alpine:20200122

# Development environment.
RUN apk add autoconf automake file g++ libtool linux-headers make musl-dev

# Dependencies. Alpine has some static binaries splitted off into specific
# packages with `-static` suffix. They're also required.
RUN apk add curl-dev curl-static libevent-dev libevent-static libmaxminddb-dev \
  nghttp2-static openssl-libs-static zlib-static

# Finally build and install MK.
ADD . /mkbuild
RUN cd /mkbuild && ./measurement-kit/build.sh
