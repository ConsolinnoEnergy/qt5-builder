#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release --disable-rpath -android-ndk-platform android-34 -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/27.2.12479018" -xplatform android-clang -android-ndk-host linux-x86_64 -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

