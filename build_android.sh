#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release --disable-rpath -android-ndk-platform android-34 -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/21.4.7075529" -xplatform android-clang -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

