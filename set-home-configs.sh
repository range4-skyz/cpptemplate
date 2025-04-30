#!/usr/bin/env bash

# Description: Add them to your home directory as global configuration
# References:
#   - https://clangd.llvm.org/config#files

mkdir -p "${HOME}/.config/clangd"

cp .clang-format "${HOME}"
cp .clangd "${HOME}/.config/clangd/config.yaml"
