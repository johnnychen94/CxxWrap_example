module Greet
  using CxxWrap
  @wrapmodule(joinpath(@__DIR__, "../../../build/julia_bindings/src", "libgreet_jlcxx"))

  function __init__()
    @initcxx
  end
end
