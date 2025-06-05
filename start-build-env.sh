#!/bin/sh
# $1 = build environment name (REQUIRED)
# $2 = directory to source tree (REQUIRED)
# $3 = command to run (OPTIONAL, defaults to /usr/bin/bash)

# Default to /usr/bin/bash if no command parameter supplied
CMD=$3
if [ -z "$CMD" ]; then
	CMD="/usr/bin/bash"
fi

# Init variables with default values
ARCH_PARAM=""
USR_DIR="$1/usr"
BUILD_DIR="$1/build"

# Script can be launched with cpu architecture to use (ARCH=arm64 ./start-build-env.sh ...)
if [ ! -z "$ARCH" ];then
	ARCH_PARAM="--arch=$ARCH"
	USR_DIR="$ARCH/$1/usr"
	BUILD_DIR="$ARCH/$1/build"
fi

# Ensure the usr/local directory exists for this environment
mkdir -p $USR_DIR $BUILD_DIR

# Start podman and bind mount:
#	/usr/local to environment specific directory
#	/src to supplied source directory
#	/build to environment build directory
podman run $ARCH_PARAM -ti --mount type=bind,src=$USR_DIR,dst=/usr/local --mount type=bind,src=$2,dst=/src --mount type=bind,src=$BUILD_DIR,dst=/build $1 $CMD
