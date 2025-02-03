#!/bin/bash

cd qt5

#./configure -opensource -confirm-license -platform android-clang -xplatform android-clang -android-sdk $ANDROID_SDK_ROOT -android-ndk $ANDROID_NDK_ROOT -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -opengl es2 -qt-libjpeg -qt-libpng -android-ndk-host linux-x86_64 -prefix /home/runner/work/qt5-builder/QtBuild

./configure -opensource -confirm-license -platform android-clang -xplatform android-clang -release --disable-rpath -android-sdk $ANDROID_SDK_ROOT -android-ndk "$ANDROID_SDK_ROOT/ndk/22.1.7171670" -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -opengl es2 -qt-libjpeg -qt-libpng -android-ndk-host linux-x86_64 -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

