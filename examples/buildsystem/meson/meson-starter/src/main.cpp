#include "version.h"
#include <format>
#include <iostream>

auto main() -> int {
    std::cout << std::format("Last git commit: {}", GIT_COMMIT_HASH);
}
