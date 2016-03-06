#! /bin/sh
docker run --rm -it -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 $@
