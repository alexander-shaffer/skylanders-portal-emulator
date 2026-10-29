#!/bin/bash

root_dir="$(dirname "$0")"
source "$root_dir/utils.sh" "$1"

has() {
  command -v "$1" &> /dev/null && display_message "Found package manager: $1"
}

display_message "Installing build dependencies..."
[[ $UID != 0 ]] && sudo=sudo 

if has apt; then
  $sudo apt-get update
  export DEBIAN_FRONTEND=noninteractive
  
  if [[ "$1" == app ]]; then
    $sudo apt-get install -y build-essential git make pkg-config cmake ninja-build gnome-desktop-testing libasound2-dev libpulse-dev libaudio-dev libfribidi-dev \
      libjack-dev libsndio-dev libx11-dev libxext-dev libxrandr-dev libxcursor-dev libxfixes-dev libxi-dev libxss-dev libxtst-dev libxkbcommon-dev libdrm-dev \
      libgbm-dev libgl1-mesa-dev libgles2-mesa-dev libegl1-mesa-dev libdbus-1-dev libibus-1.0-dev libudev-dev libthai-dev libusb-1.0-0-dev libpipewire-0.3-dev \
      libwayland-dev libdecor-0-dev liburing-dev
  else
    $sudo apt-get install -y cmake python3 build-essential gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib git ninja-build
  fi
elif has dnf; then
  if [[ "$1" == app ]]; then
    $sudo dnf install -y gcc git-core make cmake alsa-lib-devel fribidi-devel pulseaudio-libs-devel pipewire-devel libX11-devel libXext-devel libXrandr-devel \
      libXcursor-devel libXfixes-devel libXi-devel libXScrnSaver-devel libXtst-devel dbus-devel ibus-devel systemd-devel mesa-libGL-devel libxkbcommon-devel \
      mesa-libGLES-devel mesa-libEGL-devel vulkan-devel wayland-devel wayland-protocols-devel libdrm-devel mesa-libgbm-devel libusb1-devel libdecor-devel \
      pipewire-jack-audio-connection-kit-devel libthai-devel liburing-devel zlib-ng-compat-static ninja-build gcc-c++
  else
    $sudo dnf install -y cmake python3 gcc gcc-c++ make arm-none-eabi-gcc-cs arm-none-eabi-gcc-cs-c++ arm-none-eabi-newlib git ninja-build
  fi
elif has pacman; then
  if [[ "$1" == app ]]; then
    $sudo pacman -Sy --needed --noconfirm alsa-lib cmake hidapi ibus jack libdecor libthai fribidi libgl libpulse libusb libx11 libxcursor libxext libxfixes libxi \
      libxinerama libxkbcommon libxrandr libxrender libxss libxtst mesa ninja pipewire sndio vulkan-driver vulkan-headers wayland wayland-protocols base-devel git
  else
    $sudo pacman -Sy --needed --noconfirm cmake python base-devel arm-none-eabi-gcc arm-none-eabi-newlib git ninja
  fi
elif has winget; then
  if [[ "$1" == app ]]; then
    display_message "TODO"
  else
    display_message "TODO"
  fi
else
  display_error "Failed to find apt, dnf, pacman, or winget"
fi
