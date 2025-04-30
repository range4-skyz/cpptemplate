#include "version.h"
#include <format>
#include <iostream>

int main() {
    std::cout << std::format("Last git commit: {}", GIT_COMMIT_HASH);
}
