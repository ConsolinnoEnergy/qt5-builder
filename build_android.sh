#!/bin/bash

set -e

ROOT_DIR=$(pwd)

cd ..
wget https://download.qt.io/official_releases/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
tar xfv qt-everywhere-opensource-src-5.15.14.tar.xz

cd qt-everywhere-src-5.15.14

./configure 
  -opensource \
  -confirm-license \
  -release \            
  -android-sdk $ANDROID_SDK_ROOT \        
  -android-ndk "$ANDROID_SDK_ROOT/ndk/21.4.7075529" \        
  -xplatform android-clang \
  -platform linux-clang \        
  -nomake tests \
  -nomake examples \
  -skip qtlocation \
  -no-warnings-are-errors \                      
  -prefix /home/runner/work/qt5-builder/QtBuild 

make -j"$(nproc)"
make install

cd "$ROOT_DIR"
