#include "ConfigVersion.h"
#include <format>
#include <iostream>

int main() {
    std::cout << std::format(
        "PROJECT VERSION: {}.{}.{}", PROJECT_VERSION_MAJOR, PROJECT_VERSION_MINOR, PROJECT_VERSION_PATCH)
              << '\n';
    std::cout << std::format("Last git commit: {}", GIT_COMMIT_HASH);
}
