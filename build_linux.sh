#!/bin/bash

cd qt5

./configure -c++std c++17 -ssl -openssl-linked -I "/home/runner/work/master/android_openssl/ssl_3/include" -L "/home/runner/work/master/android_openssl/ssl_3" -opensource -confirm-license -release -nomake tests -nomake examples -nomake qtmultimedia -skip qtpurchasing -skip qt3d -skip qtgamepad -skip qttools -no-warnings-are-errors -prefix /home/runner/work/qt5-builder/QtBuild

sudo make -j"$(nproc)"