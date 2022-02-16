#!/bin/sh

# bail out on error
set -e

# compute the root for the project
ROOT=$(realpath $(dirname ${0})/..)

# apply the patch first
if [ ! -f ${ROOT}/3rdparty/.patch.applied ]; then
    cd ${ROOT}/3rdparty/obs-studio
    git apply ../001.patch
    >${ROOT}/3rdparty/.patch.applied
fi

# go to the proper folder
cd ${ROOT}/builders

# build obs
if [ ! -f build/libobs/libobs.a ]; then
    # generate the builder
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
