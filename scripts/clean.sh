#!/bin/bash

root_dir="$(dirname "$0")"
source "$root_dir/utils.sh" "$1"

if [[ -d build ]]; then
  display_message "Deleting build directory..."
  rm -rf build
fi
