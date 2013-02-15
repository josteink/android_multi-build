#!/usr/bin/env bash

echo "Preparing environment..."

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEVICE=$1
BUILD_DIR=$2
DEPLOY_DIR=$3
shift
shift
shift

cd $BUILD_DIR || exit 1

# sync before anything else
repo sync -j16 || exit 1

# re-create linaro envsetup, based on update envsetup from upstream repos.
# we create a linaro-envsetup no matter what, but only use it for linaro builds
$BUILDER_BASE/patch-envsetup.sh || exit 1

# re-deploy linaro toolchain. just in case. it wont overwrite our existing tools.
$BUILDER_BASE/deploy-linaro-toolchain.sh || exit 1

BUILD_TYPES=$*

echo "Executing build(s)."

# TODO: get changelog as well
#DATEVAR=`date +%Y%m%d`
#CHANGELOG_NAME="out/cm-10.1-$DATEVAR-changes.txt"
#LASTBUILD=`cat .lastbuild`
#repo forall -c git log --since="$LASTBUILD" >$CHANGELOG_NAME

# TODO: update .lastbuild in a format which git log --since understands...

for BUILD_TYPE in $BUILD_TYPES
do
   echo "Building '$BUILD_TYPE' for $DEVICE from $BUILD_DIR."
   echo "Results will be deployed to $DEPLOY_DIR."
   $BUILDER_BASE/execute_build.sh $DEVICE $BUILD_TYPE $DEPLOY_DIR || exit 1
done
