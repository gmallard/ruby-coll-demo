#!/usr/bin/env sh
#
set -x
rm -rf doc
rdoc **/*.rb README.txt
set +x

