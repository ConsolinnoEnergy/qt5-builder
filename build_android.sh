#!/bin/bash

set -e

ROOT_DIR=$(pwd)

#
# 1) Ins übergeordnete Verzeichnis wechseln und Qt-Quelltext laden/entpacken
#
cd ..
wget https://download.qt.io/official_releases/qt/5.15/5.15.14/single/qt-everywhere-opensource-src-5.15.14.tar.xz
tar xfv qt-everywhere-opensource-src-5.15.14.tar.xz

#
# 2) Optional: qt-build-tools klonen (sofern erforderlich)
#
git clone https://github.com/ConsolinnoEnergy/qt-build-tools.git
cd qt-build-tools
git checkout 197da8ca95d8552a65fb8de5274cb8f475961d7d
cd ..

#
# 3) Angepasste Dateien nach Qt-Quelltext rüberkopieren
#
rsync -av qt-build-tools/5.15.14/qtbase/ qt-everywhere-src-5.15.14/qtbase

#
# 4) In das Qt-Verzeichnis wechseln
#
cd qt-everywhere-src-5.15.14

#
# 5) Environment-Variablen für SDK/NDK müssen gesetzt sein
#    (entweder hier, in der GitHub Actions YAML, oder im System-Environment).
#    Beispiel:
export ANDROID_NDK_ROOT=/usr/local/lib/android/sdk/ndk-bundle
#

#
# 6) Qt für Android konfigurieren
#
./configure \
  -platform linux-clang \                 # Host-Platform (wenn du z.B. auf Ubuntu baust)
  -xplatform android-clang \              # Cross-Toolchain für Android
  -android-sdk $ANDROID_SDK_ROOT \        # Pfad zum SDK
  -android-ndk $ANDROID_NDK_ROOT \        # Pfad zum NDK
  -android-abis armeabi-v7a, arm64-v8a, x86_64\               # Oder ggf. mehrere ABIs (armeabi-v7a, x86, usw.)
  -opensource \
  -confirm-license \
  -release \
  -nomake tests \
  -nomake examples \
  -skip qtlocation \                      # Nur wenn du das Modul nicht brauchst
  -prefix /home/runner/work/qt5-builder/QtBuild

#
# 7) Bauen und installieren
#
make -j"$(nproc)"
make install

#
# 8) Zurück ins ursprüngliche Verzeichnis
#
cd "$ROOT_DIR"
