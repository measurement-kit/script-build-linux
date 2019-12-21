#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.7.tar.gz
sha256=abe8f2f24ed64c0fed9b439cb7f335456f11ac204a8d679c31595cdec87c6b7b
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
