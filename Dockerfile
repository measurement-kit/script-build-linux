FROM alpine:20190508
RUN apk add g++ linux-headers musl-dev zlib-dev openssl-dev \
  autoconf automake libtool file make libevent-dev
RUN find / -name \*.so|grep -v python2.7|grep -v perl5|sort -u
RUN find / -name \*.a|grep -v python2.7|grep -v perl5|sort -u
ADD . /mkbuild
RUN cd /mkbuild && ./libmaxminddb/build.sh
RUN cd /mkbuild && ./curl/build.sh
RUN cd /mkbuild && ./measurement-kit/build.sh
