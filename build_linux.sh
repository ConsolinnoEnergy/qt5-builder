#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release -nomake tests -nomake examples -skip qtlocation -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

