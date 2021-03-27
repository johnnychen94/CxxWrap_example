#! /bin/sh

if [[ $(build/app/hello/greet_hello) != "From C++: Hello, world" ]]; then exit 1; fi
julia --project=julia_bindings/Greet.jl -e 'using Pkg; Pkg.test()'
