#!/bin/sh
cd /build
cmake /src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -G Ninja
ninja install
