#!/bin/bash

set -e
root_dir="$(dirname "$0")"

"$root_dir/install-deps.sh" "$@"
"$root_dir/clean.sh" "$@"
"$root_dir/gen-build-sys.sh" "$@"
"$root_dir/build.sh" "$@"
