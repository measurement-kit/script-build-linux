#!/bin/sh
set -e
name=measurement-kit
tarball=./pkg/$name/tarball.tar.gz
builddir=./build/$name
rm -rf $builddir
install -d $builddir
tar -C $builddir -xzf $tarball
srcdir=$builddir/$name-0.10.10
(
  set -ex
  cd $srcdir
  # Note: the `-n` prevents MK from downloading assets. We do not want the
  # build to download any asset, so that, once it is started, we can rest
  # assured that it will not complete because of bad connectivity.
  ./autogen.sh -n
  # TODO(bassosimone): MK's configure is not able to handle the
  # presence of `-lz` yet, so we use this hack.
  export LIBS="-lz"
  ./configure --disable-shared --disable-dependency-tracking $CONFIGUREFLAGS
  make V=0 -j`nproc`
  make install-strip
)
