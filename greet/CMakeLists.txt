cmake_minimum_required(VERSION 3.10)

project(greet)

add_library(greet STATIC greet.cpp)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE greet)
