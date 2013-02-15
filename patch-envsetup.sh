#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp ./build/envsetup.sh ./build/envsetup-linaro.sh
patch ./build/envsetup-linaro.sh $BUILDER_BASE/data/envsetup.diff >/dev/null || exit 1

