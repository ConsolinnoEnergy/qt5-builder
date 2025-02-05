#!/bin/bash

set -e

sudo apt-get update && sudo apt-get install -y \
    build-essential \
    perl \
    python3 \
    ninja-build \
    ccache \
    flex \
    bison \
    gperf \
    ruby \
    ca-certificates \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    mesa-common-dev \
    libgbm-dev \
    libx11-dev \
    libxext-dev \
    libxfixes-dev \
    libxrender-dev \
    libxi-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libxrandr-dev \
    libxcursor-dev \
    libxcomposite-dev \
    libxdamage-dev \
    libxtst-dev \
    libxss-dev \
    libx11-xcb-dev \
    libxkbcommon-x11-0 \
    libxcb1-dev \
    libxcb-keysyms1-dev \
    libxcb-image0-dev \
    libxcb-shm0-dev \
    libxcb-icccm4-dev \
    libxcb-sync-dev \
    libxcb-xfixes0-dev \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libwayland-dev \
    libwayland-cursor0 \
    libwayland-egl1-mesa \
    libasound2-dev \
    libpulse-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-good1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    bluez \
    bluez-tools \
    libbluetooth-dev \
    libssl-dev \
    zlib1g-dev \
    libnss3-dev \
    libproxy-dev \
    libfreetype6-dev \
    libfontconfig1-dev \
    libpng-dev \
    libjpeg-dev \
    libdbus-1-dev \
    libevent-dev \
    libcap-dev \
    libudev-dev \
    libpci-dev \
    libicu-dev \
    libxslt-dev \
    nodejs \
    libc++abi1-10 \
    libc++1 \
    lib32z1 \
    libc6-i386 \
    libglvnd-dev \
    lib32stdc++6 \
    libclang-11-dev \
    llvm-11 \
    openjdk-8-jdk \
    unzip \
    wget \
    cmake \
    ant \
    libstdc++6 \
    libncurses5 \
    libncurses5-dev \
    libncursesw5 \
    libncursesw5-dev

sudo apt install clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang 

# Falls es Probleme mit libc++abi-11-dev gibt, fehlende Abhängigkeiten fixen:
sudo apt --fix-broken install -y