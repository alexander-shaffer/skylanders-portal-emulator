#!/bin/bash

root_dir="$(dirname $0)"
source "$root_dir/utils.sh" "$1"

display_message "Generating build system..."
[[ -z "$2" ]] || build_type="-DCMAKE_BUILD_TYPE=$2"

if [[ "$1" == app ]]; then
  if is_windows_system; then
    display_message "TODO"
  else
    cmake -B build -G Ninja -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ $build_type
  fi
else
  cmake -B build -G Ninja -DCMAKE_C_COMPILER_WORKS=1 -DCMAKE_CXX_COMPILER_WORKS=1 $build_type -DPICO_BOARD="$1"
fi

