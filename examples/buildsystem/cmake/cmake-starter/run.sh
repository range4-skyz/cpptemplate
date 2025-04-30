#!/usr/bin/env bash

cmake -S . -B build -G Ninja
cmake --build build

./build/src/cmake-starter
