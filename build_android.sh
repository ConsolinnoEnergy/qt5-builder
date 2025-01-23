#!/bin/bash

set -e

ROOT_DIR=$(pwd)

cd ..
git clone --branch v5.15.16-lts-lgpl https://invent.kde.org/qt/qt/qt5.git
cd qt5

perl init-repository

./configure -opensource -confirm-license -release --disable-rpath -android-ndk-platform android-34 -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/27.2.12479018" -xplatform android-clang -nomake tests -nomake examples -skip qtlocation -skip webglplugin -qt-zlib -qt-libpng -qt-libjpeg -skip webengine -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

make -j"$(nproc)"

make install

cd "$ROOT_DIR"
