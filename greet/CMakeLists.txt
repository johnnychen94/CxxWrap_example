cmake_minimum_required(VERSION 3.10)

project(greet)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
find_package(Julia REQUIRED)

execute_process(
    COMMAND "${Julia_EXECUTABLE}" --project="${CMAKE_SOURCE_DIR}" --startup-file=no -e "using CxxWrap; print(CxxWrap.CxxWrapCore.prefix_path())"
    OUTPUT_VARIABLE JlCxx_PREFIX_PATH
)
set(JlCxx_DIR "${JlCxx_PREFIX_PATH}/lib/cmake/JlCxx")
find_package(JlCxx REQUIRED)
get_target_property(JlCxx_location JlCxx::cxxwrap_julia LOCATION)
get_filename_component(JlCxx_location ${JlCxx_location} DIRECTORY)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;${JlCxx_location}")

message(STATUS "Found JlCxx at ${JlCxx_location}")

include_directories(${JlCxx_PREFIX_PATH}/include)

add_library(greet SHARED greet.cpp)
target_link_libraries(greet JlCxx::cxxwrap_julia)
