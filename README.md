Android multi-build
===================

Android multi-build is a very simple build-system built on top of the normal
Android build-system tailored for those who need to maintain multiple Android
builds.

## Features

- Build system 100% external to source-trees being built
- Automatic deployment of builds to hosting provider (FTP only)
- Linaro toolchain support
- Ability to inject Linaro toolchain seamlessly into existing source-trees.
- Simple declarative build format
- Low error tolerance: Builds fails immediately, where the error occured.

## Assumptions / tested configurations

- You already know how to build Android and have the tools required.
- Existing build is pre-primed


## Ambitions / Todo:

Not making any promises, but these are things I might want to do in the
future:

- Changelogs
- Intelligent build (dont build when there are no changes)
- Better documentation
- Extensibility (kernel variations, SSH/SCP upload)
- Email reports
- Forum posting

Contributions welcome.