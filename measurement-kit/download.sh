#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.10.tar.gz
sha256=47f3a77c5fb0674d1b3378bb6cebd1d23e8d8af955ae720243f3db25bd7e27ff
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
