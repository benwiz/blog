---
layout: post
title: How to install openFrameworks on a Mac (macOS High Sierra)
date: 2018-12-21
tags: [openFrameworks, install, mac]
ads: true
---
This is a guide and tutorial for installing [openFrameworks](https://openframeworks.cc/), a C++ toolkit for creative coding.

# Summary

- Clone openFrameworks from its GitHub repo
- Download and extract _projectGenerator_ from the official release
- Test openFrameworks to make sure it works

## Step 1: Install Dependencies - Xcode, command line tools, and wget

Download Xcode from the [app store](https://itunes.apple.com/us/app/xcode/id497799835?mt=12). Then, install Xcode's command line tools with the following command.

```sh
xcode-select --install
```

If you do not already have [Homebrew](https://brew.sh), install it.

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install `wget` using Homebrew.

```sh
brew install wget
```

## Step 2: Clone the openFrameworks repo

Clone the master branch.

```sh
git clone --recursive git@github.com:openframeworks/openFrameworks.git && cd openFrameworks
```

Download external dependencies.

```sh
/bin/bash scripts/osx/download_libs.sh
```

## Step 3: Acquire the _projectGenerator_ app

Download the official release of openFrameworks by visiting the [download page](https://openframeworks.cc/download/) or [download v0.10.1 directly](https://openframeworks.cc/versions/v0.10.1/of_v0.10.1_osx_release.zip).

Move _projectGenerator_ directory into the clone repository.

```sh
mv ~/Downloads/of_v0.10.1_osx_release/projectGenerator/ .
```

You may now delete the downloaded release directory and zip.

```sh
rm -r ~/Downloads/of_v0.10.1_osx_release*
```

## Step 4: Compile all the example apps

Open the _projectGenerator_ app.

```sh
open projectGenerator/projectGenerator.app/
```

1. Enter the path to your openFrameworks directory. For me, the path is `/Users/benwiz/code/openFrameworks`.
2. Press _enter_.
3. Check the _Advanced options_ box.
4. Click the new tab that appears at the top named _update multiple_.
5. Enter the full path to the _examples_ directory into the _Update Path_ field. For me, the path is `/Users/benwiz/code/openFrameworks/examples`.
6. Ensure that _OS X (Xcode)_ is selected for the platform.
7. Click the _Update Multiple_ button and wait for several minutes. It took my Macbook Air about 15 minutes. There is no visual feedback until a success message appears.

## Step 5: Test an example app

To ensure the installation worked correctly, open any example app in Xcode. To open _3DPrimitivesExample_ run the following command.

```sh
open examples/3d/3DPrimitivesExample/3DPrimitivesExample.xcodeproj/
```

Press `cmd + r` or click the play button to build and run the app.

## Step 6: Test a third-party app

For me, the real test is to confirm one of my own openFrameworks applications will run.

First, create and enter a directory to store your own apps.

```sh
mkdir apps/myApps && cd apps/myApps/
```

Second, clone an openFrameworks project.

```sh
git clone git@github.com:benwiz/ofSprinkles.git && cd ofSprinkles/ && git checkout 2d
```

Third, open the project.

```sh
open sprinkles.xcodeproj/
```

Lastly, run the project.
