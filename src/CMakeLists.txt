add_library(greet STATIC greet.cpp)

set(GREET_H "${CMAKE_BINARY_DIR}/include")
file(COPY greet.hpp DESTINATION ${GREET_H})
