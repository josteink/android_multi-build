#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PREBUILT=$BUILDER_BASE/prebuilt

# ensure we have the folder right.
mkdir -p $PREBUILT || exit 1

# ensure we have toolchain
SOURCE_URL="http://releases.linaro.org/13.01/components/android/toolchain/4.7/android-toolchain-eabi-linaro-4.7-2013.01-1-2013-01-17_01-27-05-linux-x86.tar.bz2"
LINARO_ARCHIVE=$PREBUILT/`basename $SOURCE_URL`

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

# TODO: when above is done: merge with envsetup. remove patched envsetup on post-build for complete cleanup.

echo "Done."
