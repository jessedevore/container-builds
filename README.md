The start-build-env script creates a directory structure for the environment, which gets bind mounted into the environemnt. The image name is used in the structure. If the image name is ubuntu-dev:20.04, here's the structure and how it would get mounted into the environment:

| **Host directory** | **Mount** |
|---|---|
| ubuntu-dev:20.04/usr | /usr/local |
| ubuntu-dev:20.04/build | /build |

The first parameter to this script is the image name. The second parameter is the source tree directory, which gets bind mounted to /src in the container.

The third parameter is optional, and is the command to be run by the container. The default is /usr/bin/bash.

The script can also be prepended with an architecture name, such as arm64. This will modify the created directory structure and bind mounts. The architecture becomes the top level directory, with the image name as a sub.

One way to run builds is to copy a build script into the build directory and pass that as the command to run. Sample build scripts are included in this repository.
