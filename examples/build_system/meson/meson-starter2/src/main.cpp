#include "config.h"
#include <fmt/base.h>
#include <fmt/color.h>

auto main(int /*argc*/, char * /*argv*/[]) -> int {

    // std::cout << std::format("Last git commit: {}\n", GIT_COMMIT_HASH);
    // std::cout << std::format("Project version: {}\n", VERSION);

    fmt::print(fg(fmt::color::green), "Last git commit: {}\n", GIT_COMMIT_HASH);
    fmt::print(fg(fmt::color::cyan) | fmt::emphasis::italic, "Project version: {}\n", PROJECT_VERSION);

    return 0;
}
