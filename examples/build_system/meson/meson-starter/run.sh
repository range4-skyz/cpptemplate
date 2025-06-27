#!/usr/bin/env bash

export CC=clang
export CC_LD=lld

mkdir -p build

meson setup build
meson compile -C build

./build/src/meson_starter
