#!/bin/bash

set -e

ROOT_DIR=$(pwd)

cd ..
wget https://download.qt.io/official_releases/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
tar xfv qt-everywhere-opensource-src-5.15.14.tar.xz

cd qt-everywhere-src-5.15.14

./configure \
  -platform linux-clang \ 
  -xplatform android-clang \             
  -android-sdk $ANDROID_SDK_ROOT \        
  -android-ndk $ANDROID_NDK_ROOT \        
  -android-abis armeabi-v7a, arm64-v8a, x86_64\         
  -opensource \
  -confirm-license \
  -release \
  -nomake tests \
  -nomake examples \
  -skip qtlocation \                      
  -prefix /home/runner/work/qt5-builder/QtBuild

make -j"$(nproc)"
make install

cd "$ROOT_DIR"
