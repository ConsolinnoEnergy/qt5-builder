#!/bin/bash

cd qt5

./configure -c++std c++17 -ssl -openssl-linked -I "/home/runner/work/master/android_openssl/ssl_3/include" -L "/home/runner/work/master/android_openssl/ssl_3" -opensource -confirm-license -release -nomake tests -nomake examples -skip qtlocation -skip qtmultimedia -skip qtpurchasing -skip qtwebengine -no-warnings-are-errors -no-opengl -qt-libjpeg -qt-libpng -prefix -prefix "/home/runner/work/qt5-builder/QtBuild"

sudo make -j"$(nproc)"