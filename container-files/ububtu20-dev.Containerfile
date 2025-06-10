FROM ubuntu:20.04

# Install gcc, g++, and make
# libfindbin-libs-perl is needed to compile OpenSSL
# libgtest-dev needed for compiling Ninja
RUN apt update && apt install -y gcc-10 g++-10 make libfindbin-libs-perl libgtest-dev

# Set gcc/g++ 10 as the default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10

# OpenSSL will install libraries to /usr/local/lib64 by default, so add it
# into the library search paths
RUN echo '/usr/local/lib64' >> /etc/ld.so.conf && ldconfig
