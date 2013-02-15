#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# local build-root
ANDROID_BASE=/mnt/build/android

# remote deploy-root, relative or absolute path once logged in
DEPLOY_BASE=./nexfiles.kjonigsen.net

DO_BUILD=$BUILDER_BASE/execute_builds.sh

$DO_BUILD maguro $ANDROID_BASE/maguro/4.2/ $DEPLOY_BASE/cm10.1/       linaro
$DO_BUILD tf101  $ANDROID_BASE/tf101/4.1/  $DEPLOY_BASE/tf101/cm10/   standard linaro
$DO_BUILD tf101  $ANDROID_BASE/tf101/4.2/  $DEPLOY_BASE/tf101/cm10.1/ standard linaro



