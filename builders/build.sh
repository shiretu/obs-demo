#!/bin/sh

# bail out on error
set -e

# compute the root for the project
ROOT=$(realpath $(dirname ${0})/..)

# build obs
if [ ! -f build/libobs/libobs.a ]; then
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

# install node stuff
if [ ! -f node_modules/.bin/node-gyp ]; then
    npm install node-gyp node-addon-api
fi

# build the nodejs addon
./node_modules/.bin/node-gyp configure build

# execute the JS script
node ../source/my_module/js/test.js
