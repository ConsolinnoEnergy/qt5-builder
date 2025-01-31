#!/bin/bash

cd qt5

./configure -opensource -confirm-license -platform android-clang -xplatform android-clang -android-sdk "$ANDROID_SDK_ROOT" -android-ndk "$ANDROID_SDK_ROOT/ndk/21.4.7075529" -nomake tests -nomake examples -skip qttranslations -skip qtserialport -no-warnings-are-errors -opengl es2 -qt-libjpeg -qt-libpng -prefix /home/runner/work/qt5-builder/QtBuild

sudo make -j"$(nproc)"

