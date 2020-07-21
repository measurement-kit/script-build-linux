#!/bin/sh
url=https://github.com/measurement-kit/measurement-kit/archive/v0.10.12.tar.gz
sha256=508d9db72579efbe4747dd791771f47299bc5867c72d67a86e371d66d20fd19e
name=measurement-kit
destdir=pkg/$name
set -ex
rm -rf $destdir
install -d $destdir
curl -fsSLo $destdir/tarball.tar.gz $url
[ "`shasum -a 256 $destdir/tarball.tar.gz|awk '{print $1}'`" = $sha256 ]
