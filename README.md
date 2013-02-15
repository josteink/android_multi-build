Android multi-build
===================

Android multi-build is a very simple build-system built on top of the normal
Android build-system tailored for those who need to maintain multiple Android
builds.

## Features

- Build system 100% external to source-trees being built.
- Automatic deployment of builds to hosting provider (FTP only for now).
- Automatic (and optional) Linaro toolchain support.
- Ability to non-destructively inject Linaro toolchain seamlessly into
  existing source-trees.
- Simple (very simple), declarative build format.
- Low error tolerance: Builds fails immediately, where the error occured.

## Assumptions / tested configurations

- You already have one or several Android source-trees and you
  [know how to build them](http://source.android.com/source/).
- Existing trees are pre-primed, have vendor-binaries, etc and are ready to build.
- Tree is a [CyanogenMod](https://github.com/CyanogenMod/) or similar AOSP-based
  tree which can be built with the normal Android build procedures.
- One tree is used for one device only. While re-using the same tree for multiple
  devices might work today, it will surely break a future implementation of
  changelog-generation.

## Ambitions / Todo:

Not making any promises, but these are things I might want to do in the
future:

- Automatically generate changelogs for builds.
- A more intelligent build (dont build when there are no changes).
- Automatically determine if a tree needs to be cleaned or not prior to build.
- Better documentation, in code and elsewhere.
- Extensibility (kernel variations, SSH/SCP upload).
- Email reports.
- Forum posting of builds.

**Contributions welcome.**