#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.6.tar.gz
sha256=5ec94e522c3bc43cbf749659c18d4b13bcfbb2874db4d6b4e21b160d76dd5bd0
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
