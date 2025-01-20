#!/bin/bash

set -e

ROOT_DIR=$(pwd)

cd ..
wget https://download.qt.io/official_releases/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
tar xfv qt-everywhere-opensource-src-5.15.14.tar.xz

git clone https://github.com/ConsolinnoEnergy/qt-build-tools.git
cd qt-build-tools
git checkout 197da8ca95d8552a65fb8de5274cb8f475961d7d
cd ..

rsync -av qt-build-tools/5.15.14/qtbase/ qt-everywhere-src-5.15.14/qtbase

cd qt-everywhere-src-5.15.14

#export ANDROID_NDK_ROOT=/usr/local/lib/android/sdk/ndk-bundle

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
