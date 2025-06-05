#!/bin/sh
cd /build
cmake /src -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr/local -G Ninja
ninja install
