#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PREBUILT=$BUILDER_BASE/prebuilt

# based on http://forum.xda-developers.com/showthread.php?t=1988315
# TODO: detect latest automatically?
SOURCE_URL="http://releases.linaro.org/12.11/components/android/toolchain/4.7/android-toolchain-eabi-linaro-4.7-2012.11-1-2012-11-16_21-55-58-linux-x86.tar.bz2"

# TODO: detect automatically from URL
LINARO_ARCHIVE=$PREBUILT/android-toolchain-eabi-linaro-4.7-2012.11-1-2012-11-16_21-55-58-linux-x86.tar.bz2

# ensure we have the folder right.
mkdir -p $PREBUILT || exit 1

if [ ! -f "$LINARO_ARCHIVE" ] ; then
   echo "Fetching toolchain..."
   wget -O $LINARO_ARCHIVE $SOURCE_URL || exit 1
fi

# TODO: pre-extract toolchain and just symlink it into target. will be MUCH faster.

echo "Extracting Linaro toolchain..."
cd prebuilts/gcc/linux-x86/arm/ || exit 1
tar xjf $LINARO_ARCHIVE || exit 1

# TODO: allow register/unregister to clean up on a *per-build basis*.
# only do a "make clean" when doing changes to configuration.

# invoke -register and -unregister on pre-build and post-build steps
# of linaro builds. if so, also make clean.

echo "Done."
