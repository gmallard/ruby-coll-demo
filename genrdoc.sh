#!/usr/bin/env sh
#
set -x
rm -rf doc
rdoc -t "Ruby Collection Demonstration" **/*.rb README.txt
set +x

