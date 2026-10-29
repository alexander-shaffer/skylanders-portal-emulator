#!/bin/bash

root_dir="$(dirname "$0")"
source "$root_dir/utils.sh" "$1"

display_message "Building..."

if is_windows_system; then
  [[ -z "$2" ]] || build_type="--config $2"
fi

cmake --build build "$build_type"
