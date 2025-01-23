#!/bin/bash

set -e

ROOT_DIR=$(pwd)

cd ..
wget https://download.qt.io/official_releases/qt/5.15/5.15.16/single/qt-everywhere-opensource-src-5.15.16.tar.xz
tar xfv qt-everywhere-opensource-src-5.15.16.tar.xz

cd qt-everywhere-src-5.15.16

./configure -opensource -confirm-license -release --disable-rpath -android-ndk-platform android-34 -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/27.2.12479018" -xplatform android-clang -nomake tests -nomake examples -skip qtlocation -skip webglplugin -qt-zlib -qt-libpng -qt-libjpeg -skip webengine -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

make -j"$(nproc)" install 

cd "$ROOT_DIR"
