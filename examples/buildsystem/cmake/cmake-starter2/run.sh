#!/usr/bin/env bash

set -xe

export CC=clang
export CC_LD=lld

export CXX=clang++
export CXX_LD=lld

cmake -S . -B build -GNinja #-DENABLE_MOLD=ON
cmake --build build

# readelf -p .comment ./build/src/cmake-starter # Verify that you are using mold

./build/src/cmake-starter
