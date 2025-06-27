#include "ConfigVersion.h"
#include <format>
#include <iostream>

auto main() -> int {
    std::cout << std::format("Project version: {}.{}.{}\n",
                             PROJECT_VERSION_MAJOR,
                             PROJECT_VERSION_MINOR,
                             PROJECT_VERSION_PATCH);
    std::cout << std::format("Last git commit: {}", GIT_COMMIT_HASH);
}
