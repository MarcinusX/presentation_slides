# Desktop Embedding for Flutter

This project was originally created to develop Windows, macOS, and Linux
implementations of [Flutter](https://github.com/flutter/flutter). That work has
since become part of the
[Flutter engine repository](https://github.com/flutter/engine), and this
project is now just an example of, and test environment for, building
applications using those libraries.

For information about the shells themselves, see the [Flutter page about
desktop support](https://github.com/flutter/flutter/wiki/Desktop-shells).

## How to Use This Code

_If you have an existing Flutter app and just want to get it running, see
the [quick start](Quick-Start.md) page before continuing._

### Setting Up

Ensure that you are on the latest version of the [Flutter master
channel](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels#how-to-change-channels).

#### Tools

You will need developer tools for your platform:
* Linux: A recent version of GCC
* macOS: Make sure `flutter doctor` reports no issues for the "Xcode" section.
* Windows: Visual Studio 2017 or 2019, including the "Desktop development with C++" workload.

### Repository Structure

The `example` directory contains an example application built using the library
for each platform. See [its README](example/README.md) to get started.

The `plugins` directory has early-stage plugins, which provide access to
additional platform functionality. These follow a similar structure to
[Flutter plugins](https://flutter.io/developing-packages/). See the
[README](plugins/README.md) for details.

## Debugging

Debugging of the Flutter side of a desktop application is possible, but
[requires setup](Debugging.md).

## Feedback and Discussion

For bug reports and specific feature requests, you can file GitHub issues. For
general discussion and questions there's a [project mailing
list](https://groups.google.com/forum/#!forum/flutter-desktop-embedding-dev).

When submitting issues related to build errors or other bugs, please make sure
to include the git hash of the Flutter checkout you are using. This will help
speed up the debugging process.

## Caveats

* This is not an officially supported Google product.
* The code and examples here, and the desktop Flutter libraries they use, are
  in early stages, and not intended for production use.
* There is currently no versioning system for coordinating the version
  of this project with the required version of Flutter. For now the expectation
  is that anyone experimenting with this project will be tracking Flutter's
  master branch. If you encounter build issues, try using a newer version of
  Flutter. If your issues are specific to the latest Flutter master, please
  file a bug!
