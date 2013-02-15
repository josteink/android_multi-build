#!/usr/bin/env bash

# script-folder, without trailing /
BUILDER_BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# build runner
DO_BUILD=$BUILDER_BASE/execute_builds.sh

# CONFIGURE: local build-root
ANDROID_BASE=/mnt/build/android

# CONFIGURE: remote deploy-root, relative or absolute path once logged in.
# does not refer to a internet DNS name or anything like that.
DEPLOY_BASE=./nexfiles.kjonigsen.net

#
# FORMAT:
#
# $DO_BUILD device tree-location deploy-location configurations
#
# device:          as in a normal android build.
# tree-location:   local file-system location for the Android source-tree.
# deploy-location: remote file-system location for resulting builds.
#                  will be logged in based on server in data/server.cfg
# configurations:  space-delimited list of configurations. currently only
#                  2 types of configrations are supported "standard" and "linaro".
#                  this parameter is case-sensitive.
#

$DO_BUILD maguro $ANDROID_BASE/maguro/4.2/ $DEPLOY_BASE/cm10.1/       linaro
$DO_BUILD tf101  $ANDROID_BASE/tf101/4.1/  $DEPLOY_BASE/tf101/cm10/   standard linaro
$DO_BUILD tf101  $ANDROID_BASE/tf101/4.2/  $DEPLOY_BASE/tf101/cm10.1/ standard linaro
