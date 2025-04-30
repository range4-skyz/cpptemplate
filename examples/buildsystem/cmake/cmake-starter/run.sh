#!/usr/bin/env bash

cmake -S . -B build --install-prefix "$PWD" -GNinja
cmake --build build --parallel
cmake --install build/

./bin/cmake-starter
