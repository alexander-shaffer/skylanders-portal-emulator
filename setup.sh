#!/bin/bash

set -e
root_dir="$(dirname $0)"

"$root_dir/install_deps.sh" "$@"
"$root_dir/clean.sh" "$@"
"$root_dir/gen_build_sys.sh" "$@"
"$root_dir/build.sh" "$@"

