#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEVICE=$1
BUILD_TYPE=$2
DEPLOY_DIR=$3

# defaults
SUFFIX=""
ENVSETUP="./build/envsetup.sh"

# clean up any previous bits, just in case.
make clean

if [ "$BUILD_TYPE" == "linaro" ] ; then
    echo "Build-type: linaro."
    SUFFIX="-linaro"
    ENVSETUP="./build/envsetup-linaro.sh"
fi

. $ENVSETUP

# not sure this is needed, but wth
breakfast $DEVICE

export USE_CCACHE=1
croot
brunch $DEVICE || exit 1

# ensure we are getting a build created NOW, and not some older build
# created on an earlier date.
DATEVAR=`date +%Y%m%d`
LATEST=`find $OUT -type f -name cm-10*$DATEVAR*.zip | sort | tail -n 1` || exit 1
LATEST_MD5=$LATEST.md5sum

if [ "$BUILD_TYPE" == "linaro" ] ; then
    LATEST_LINARO=`echo $LATEST | perl -pe "s/(-linaro)*\.zip/-linaro.zip/"`
    LATEST_LINARO_MD5=$LATEST_LINARO.md5sum
    mv "$LATEST" "$LATEST_LINARO" || exit 1
    # TODO: regenerate MD5 file because the filename inside it needs to be updated.
    mv "$LATEST_MD5" "$LATEST_LINARO_MD5" || exit 1
    LATEST=$LATEST_LINARO
    LATEST_MD5=$LATEST_LINARO_MD5
fi

echo Uploading files:
echo $LATEST
echo $LATEST_MD5

echo "Uploading to FTP..."

ncftpput -f $BUILDER_BASE/data/server.cfg $DEPLOY_DIR $LATEST $LATEST_MD5

echo "Done!"
