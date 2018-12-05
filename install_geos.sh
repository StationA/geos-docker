#!/bin/sh

set -e

INSTALL_PREFIX=${INSTALL_PREFIX:-/usr}
BUILD_DIR=${BUILD_DIR:-/tmp}
GEOS_VER="3.7.1"
GEOS_DIR="$BUILD_DIR/geos-$GEOS_VER"

# Download source and unzip contents
OLDPWD=`pwd`
cd $BUILD_DIR
wget -O geos.tar.gz https://github.com/libgeos/geos/archive/3.7.1.tar.gz
tar xzf geos.tar.gz
rm geos.tar.gz
cd $OLDPWD

# Copy built libs to system directories
OLDPWD=`pwd`
cd $GEOS_DIR
./autogen.sh
./configure
make -j9
make install

rm -rf $GEOS_DIR
