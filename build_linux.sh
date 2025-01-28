#!/bin/bash

cd qt5

./configure -opensource -confirm-license -release -nomake tests -nomake examples -skip qtlocation -skip webglplugin -skip webengine -prefix /home/runner/work/qt5-builder/QtBuild 

sudo make -j"$(nproc)"

