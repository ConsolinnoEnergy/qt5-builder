#!/bin/bash

set -e
ROOT_DIR=$(pwd)
cd ..
git clone https://code.qt.io/qt/qt5.git
cd qt5 && git checkout 5.15
perl init-repository --module-subset=default,-qtwebengine
# Quick and dirty patch. Should be done using a patch file, when things are running.
# See https://decovar.dev/blog/2018/02/17/build-qt-statically/
sed -i'' -e 's/unary_function/__unary_function/' qtmultimedia/src/plugins/avfoundation/camera/avfcamerautility.mm
git clone https://github.com/crystalidea/qt-build-tools.git
cd ..
rsync -av qt-build-tools/5.15.14/qtbase/ qt5/qtbase
cd qt5
./configure QMAKE_APPLE_DEVICE_ARCHS="x86_64 arm64" -opensource -confirm-license -nomake examples -nomake tests -xplatform macx-ios-clang -release -no-openssl -securetransport -prefix /Users/runner/work/qt5-builder/QtBuild
make -j$(sysctl -n hw.ncpu)
make install
cd $ROOT_DIR
