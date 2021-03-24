cmake_minimum_required(VERSION 3.10)

project(greet_jlcxx)

# make sure Julia and JlCXX is found
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

include_directories(${JlCxx_PREFIX_PATH}/include)

# JlCxx requires the library to be built as shared
add_library(greet_jlcxx SHARED greet.cpp)
target_link_libraries(greet_jlcxx greet JlCxx::cxxwrap_julia)

install(TARGETS
    greet_jlcxx
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION lib
)
