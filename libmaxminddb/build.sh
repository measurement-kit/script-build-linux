#!/bin/sh -e
name=libmaxminddb
tarball=./pkg/$name/tarball.tar.gz
builddir=./build/$MKARCH/$name
rm -rf $builddir
install -d $builddir
tar -C $builddir -xzf $tarball
srcdir=$builddir/libmaxminddb-1.3.2
(
  set -ex
  cd $srcdir
  ./bootstrap
  ./configure --disable-shared --disable-tests \
    --disable-dependency-tracking $CONFIGUREFLAGS
  make V=0 -j`nproc`
  make install-strip
)
