#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.8.tar.gz
sha256=773c0f03fa21b56b34a24f97b4fedf96e66b0f49ef549d5c674e63ed43e1c278
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
