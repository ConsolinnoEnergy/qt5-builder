#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release --disable-rpath -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/22.1.7171670" -xplatform android-clang -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

