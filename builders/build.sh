#!/bin/sh

# bail out on error
set -e

# compute the root for the project
ROOT=$(realpath $(dirname ${0})/..)

if [ ! -f build/libobs/libobs.dylib ]; then
    # generate the builder
    cd ${ROOT}/builders
    cmake \
        -Bbuild \
        -GNinja \
        -DENABLE_UI=Off \
        -DBUILD_BROWSER=Off \
        -DBUILD_VST=Off \
        ${ROOT}/3rdparty/obs-studio

    # do the build
    cmake --build build --target libobs
fi
