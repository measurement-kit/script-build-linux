#!/bin/sh -e
if [ $# -eq 0 ]; then
  echo "Usage: $0 [all|package...]" 1>&2
  exit 1
else
  allpkgs="$@"
  if [ $allpkgs = "all" ]; then
    allpkgs="curl libmaxminddb measurement-kit"
  fi
fi
set -x
for dir in $allpkgs; do
  source ./$dir/download.sh
  rm -rf ./pkg/$dir
  mkdir ./pkg/$dir
  curl -fsSL -o ./pkg/$dir/tarball.tar.gz $url
  [ "$sha256" = "`shasum -a 256 pkg/$dir/tarball.tar.gz | awk '{print $1}'`" ]
done
