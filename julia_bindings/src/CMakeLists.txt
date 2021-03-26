cmake_minimum_required(VERSION 3.16)

project(greet_jlcxx)

# JlCxx requires the library to be built as shared
add_library(greet_jlcxx SHARED jlgreet.cpp)

message(STATUS "greet source dir: ${greet_SOURCE_DIR}")
target_include_directories(greet_jlcxx
    PRIVATE ${CMAKE_BINARY_DIR}/include
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
