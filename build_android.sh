#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release --disable-rpath -android-sdk $ANDROID_SDK_ROOT -android-ndk $ANDROID_NDK_ROOT -xplatform android-clang -android-ndk-host linux-x86_64 -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

