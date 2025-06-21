#!/usr/bin/env bash

# Description: Check configuration information

# .clang-tidy
clang-tidy --verify-config

# .clang-format
clang-format -style=file -dump-config
