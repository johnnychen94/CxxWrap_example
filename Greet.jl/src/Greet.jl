module Greet
  using CxxWrap
  @wrapmodule(joinpath(@__DIR__, "../../build/greet_jlcxx","libgreet_jlcxx"))

  function __init__()
    @initcxx
  end
end
