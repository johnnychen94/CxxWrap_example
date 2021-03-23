cmake_minimum_required(VERSION 3.10)

project(greet)

add_library(${PROJECT_NAME} greet.cpp)
target_include_directories(${PROJECT_NAME}
    INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
    )
