#!/bin/bash

cd qt5

./configure -c++std c++17 -ssl -openssl-linked -I "/home/runner/work/master/android_openssl/ssl_3/include" -L "/home/runner/work/master/android_openssl/ssl_3" -opensource -confirm-license -release -nomake tests -nomake examples -no-warnings-are-errors -skip qtlocation -skip qtmultimedia -skip qtpurchasing -skip qtwebengine -skip qtwebglplugin -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

