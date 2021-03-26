##
# Load Julia dependencies, including external JlCxx
##
cmake_minimum_required(VERSION 3.16)

project(greet_jlcxx)

set(JLCXX_VER 0.8.2)
find_package(jlcxx ${JLCXX_VER} QUIET)
if (NOT jlcxx_FOUND)
    include(FetchContent)
    FetchContent_Declare(jlcxx
                         GIT_REPOSITORY https://github.com/JuliaInterop/libcxxwrap-julia.git
                         GIT_TAG v${JLCXX_VER})
    FetchContent_MakeAvailable(jlcxx)
endif ()

# JlCxx requires the library to be built as shared
add_library(greet_jlcxx SHARED greet.cpp)
target_include_directories(greet_jlcxx
    PRIVATE ${greet_SOURCE_DIR}
    PRIVATE ${jlcxx_SOURCE_DIR}/include)
target_link_libraries(greet_jlcxx
    PRIVATE greet
    PRIVATE cxxwrap_julia)

install(TARGETS
    greet_jlcxx
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION lib
)
