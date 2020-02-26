#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.11.tar.gz
sha256=f9dbf5f721516fd709c13ac5011737b3622076299e3c899a1f70861901ec1b40
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
