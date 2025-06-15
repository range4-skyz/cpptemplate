#!/usr/bin/env bash

# Docs: https://mesonbuild.com/Commands.html

export CC=clang
export CC_LD=lld

export CXX=clang++
export CXX_LD=lld

# meson setup build -Denable-mold=true          # synatx -Doption=new_value
# readelf -p .comment ./build/src/meson_starter # Verify that you are using mold

meson setup build

# If you have already completed the build, you can still modify the options before compiling.
# meson configure build -Denable-mold=true

meson compile -C build # equivant to `ninja -C build`
# meson compile -C build -j"$(nproc)" # Parallel compilation

# meson install -C build --destdir test_install # install on $DESTDIR/<prefix>, for testing installation
# meson install -C build # install on <prefix>
