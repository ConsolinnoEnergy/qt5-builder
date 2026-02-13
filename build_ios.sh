#!/bin/bash

set -e
ROOT_DIR=$(pwd)
cd ..
wget https://download.qt.io/archive/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
tar xf qt-everywhere-opensource-src-5.15.14.tar.xz
cd qt-everywhere-src-5.15.14
# Quick and dirty patch. Should be done using a patch file, when things are running.
# See https://decovar.dev/blog/2018/02/17/build-qt-statically/
sed -i'' -e 's/unary_function/__unary_function/' qtmultimedia/src/plugins/avfoundation/camera/avfcamerautility.mm
cd ..
git clone https://github.com/ConsolinnoEnergy/qt-build-tools.git
cd qt-build-tools && git checkout 197da8ca95d8552a65fb8de5274cb8f475961d7d && cd ..
rsync -av qt-build-tools/5.15.14/qtbase/ qt-everywhere-src-5.15.14/qtbase
cd qt-everywhere-src-5.15.14
# Apply patch for Xcode 16.2+ where fp.h has been removed
echo "=== Full content of pngpriv.h before patch ==="
cat qtbase/src/3rdparty/libpng/pngpriv.h
echo "=== End of pngpriv.h content ==="
echo "=== Applying patch with verbose output ==="
patch -p1 --verbose --debug < $ROOT_DIR/ios_pngpriv_h.patch || {
  echo "=== Patch failed! Showing reject files ==="
  find . -name "*.rej" -exec echo "File: {}" \; -exec cat {} \;
  exit 1
}
./configure QMAKE_APPLE_DEVICE_ARCHS="arm64" -opensource -confirm-license -nomake examples -nomake tests -xplatform macx-ios-clang -release -no-openssl -securetransport -skip qtlocation -prefix /Users/runner/work/qt5-builder/QtBuild

make -j$(sysctl -n hw.ncpu)
make install
cd $ROOT_DIR

