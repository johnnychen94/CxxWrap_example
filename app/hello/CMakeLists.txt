cmake_minimum_required(VERSION 3.16)
project(hello)

enable_testing()

# find_package(greet REQUIRED)

add_executable(greet_hello main.cpp)

target_include_directories(greet_hello PRIVATE ${CMAKE_BINARY_DIR}/include)
target_link_libraries(greet_hello PRIVATE greet)

add_test(NAME hello_app COMMAND hello_test)
set_tests_properties(hello_app PROPERTIES
                     LABELS hello
                     PASS_REGULAR_EXPRESSION "Success!"
                     SKIP_REGULAR_EXPRESSION "\\[SKIP\\]")
