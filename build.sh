#!/bin/bash

set -e

display_message() {
  echo -e "\e[1;32m$1\e[0m"
}

display_error() {
  echo -e "\e[1;31m$1\e[0m"
  exit 1
}

has() {
  command -v "$1" &> /dev/null
}

install_build_deps() {
  display_message "Installing build dependencies..."
  [[ "$UID" != 0 ]] && sudo=sudo

  if has winget; then
    common_args="--silent --accept-source-agreements --accept-package-agreements --disable-interactivity"

    if [[ -v is_app ]]; then
      winget install $common_args Git.Git Kitware.CMake
      winget install $common_args --force Microsoft.VisualStudio.BuildTools --override "--quiet --wait --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"
    else
      winget install $common_args Git.Git Kitware.CMake Ninja-build.Ninja Arm.ArmGnuToolchain Python.Python.3.14 MartinStorsjo.LLVM-MinGW.MSVCRT
    fi
  elif has apt; then
    $sudo apt-get update
    export DEBIAN_FRONTEND=noninteractive

    if [[ -v is_app ]]; then
      $sudo apt-get install -y build-essential git make pkg-config cmake ninja-build gnome-desktop-testing libasound2-dev libpulse-dev libaudio-dev libfribidi-dev \
        libjack-dev libsndio-dev libx11-dev libxext-dev libxrandr-dev libxcursor-dev libxfixes-dev libxi-dev libxss-dev libxtst-dev libxkbcommon-dev libdrm-dev \
        libgbm-dev libgl1-mesa-dev libgles2-mesa-dev libegl1-mesa-dev libdbus-1-dev libibus-1.0-dev libudev-dev libthai-dev libusb-1.0-0-dev libpipewire-0.3-dev \
        libwayland-dev libdecor-0-dev liburing-dev
    else
      $sudo apt-get install -y cmake python3 build-essential gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib git ninja-build
    fi
  elif has dnf; then
    if [[ -v is_app ]]; then
      $sudo dnf install -y gcc git-core make cmake alsa-lib-devel fribidi-devel pulseaudio-libs-devel pipewire-devel libX11-devel libXext-devel libXrandr-devel \
        libXcursor-devel libXfixes-devel libXi-devel libXScrnSaver-devel libXtst-devel dbus-devel ibus-devel systemd-devel mesa-libGL-devel libxkbcommon-devel \
        mesa-libGLES-devel mesa-libEGL-devel vulkan-devel wayland-devel wayland-protocols-devel libdrm-devel mesa-libgbm-devel libusb1-devel libdecor-devel \
        pipewire-jack-audio-connection-kit-devel libthai-devel liburing-devel zlib-ng-compat-static ninja-build gcc-c++
    else
      $sudo dnf install -y cmake python3 gcc gcc-c++ make arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ arm-none-eabi-newlib git ninja-build
    fi
  elif has pacman; then
    if [[ -v is_app ]]; then
      $sudo pacman -Sy --needed --noconfirm alsa-lib cmake hidapi ibus jack libdecor libthai fribidi libgl libpulse libusb libx11 libxcursor libxext libxfixes libxi \
        libxinerama libxkbcommon libxrandr libxrender libxss libxtst mesa ninja pipewire sndio vulkan-driver vulkan-headers wayland wayland-protocols base-devel git
    else
      $sudo pacman -Sy --needed --noconfirm cmake python base-devel arm-none-eabi-gcc arm-none-eabi-newlib git ninja
    fi
  else
    display_error "Failed to find winget, apt, dnf, or pacman"
  fi
}

generate_build_system() {
  display_message "Generating build system..."

  if [[ -v is_app ]]; then
    if has winget; then
      cmake -B "$build_file" -G "Visual Studio 18 2026"
    else
      cmake -B "$build_file" -G Ninja -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE="$build_type"
    fi
  else
    cmake -B "$build_file" -G Ninja -DCMAKE_C_COMPILER_WORKS=1 -DCMAKE_CXX_COMPILER_WORKS=1 -DCMAKE_BUILD_TYPE="$build_type" -DPICO_BOARD="$pico_board"
  fi
}

[[ -v 2 ]] && build_type="$2" || build_type=Debug

if [[ "$1" == app ]]; then
  is_app=true
  build_file="build/${build_type,,}"
  cd "$(dirname "$0")/app"
elif [[ "$1" == picow || "$1" == pico2w ]]; then
  [[ "$1" == picow ]] && pico_board=pico_w || pico_board=pico2_w
  build_file="build/$1-${build_type,,}"
  cd "$(dirname "$0")/pico"
else
  display_error "Expected the first argument to be app, picow, or pico2w"
fi

marker_file=.install-deps-marker

if [[ ! -f "$marker_file" ]]; then
  install_build_deps
  touch "$marker_file"
fi

if [[ ! -d "$build_file" ]]; then
  generate_build_system
fi

display_message "Building..."
[[ -v is_app ]] && has winget && config="--config $build_type"
cmake --build "$build_file" $config
