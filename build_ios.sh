#!/bin/bash

set -e
ROOT_DIR=$(pwd)
#cd ..
#wget https://download.qt.io/official_releases/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
#tar xfv qt-everywhere-opensource-src-5.15.14.tar.xz
#cd qt-everywhere-src-5.15.14
## Quick and dirty patch. Should be done using a patch file, when things are running.
## See https://decovar.dev/blog/2018/02/17/build-qt-statically/
#sed -i'' -e 's/unary_function/__unary_function/' qtmultimedia/src/plugins/avfoundation/camera/avfcamerautility.mm
#cd ..
#git clone https://github.com/crystalidea/qt-build-tools.git
#rsync -av qt-build-tools/5.15.14/qtbase/ qt-everywhere-src-5.15.14/qtbase
#cd qt-everywhere-src-5.15.14
#./configure QMAKE_APPLE_DEVICE_ARCHS="arm64" -opensource -confirm-license -nomake examples -nomake tests -xplatform macx-ios-clang -release -no-openssl -securetransport -skip qtlocation -prefix /Users/runner/work/qt5-builder/QtBuild
#
#make -j$(sysctl -n hw.ncpu)
#make install
mkdir /Users/runner/work/qt5-builder/QtBuild
touch /Users/runner/work/qt5-builder/QtBuild/test
cd $ROOT_DIR

