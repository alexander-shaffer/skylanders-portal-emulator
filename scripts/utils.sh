#!/bin/bash

set -e

display_message() {
  echo -e "\e[1;32m$1\e[0m"
}

display_error() {
  echo -e "\e[1;31m$1\e[0m"
  exit 1
}

is_windows_system() {
  command -v winget &> /dev/null
}

if [[ "$1" == app ]]; then
  cd "$(dirname "$0")/../app"
elif [[ "$1" == pico_w || "$1" == pico2_w ]]; then
  cd "$(dirname "$0")/../pico"
else
  display_error "Expected the first argument to be app, pico_w, or pico2_w"
fi
