#! /bin/sh

if [[ $(build/greet/main) != "From C++: Hello, world" ]]; then exit 1; fi
julia --project=Greet.jl -e 'using Pkg; Pkg.test()'
