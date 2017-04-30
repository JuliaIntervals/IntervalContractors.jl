module IntervalContractors

using IntervalArithmetic
using Compat

const half_pi = IntervalArithmetic.half_pi(Float64)

Base.:∪(f::Function, g::Function) = X -> ( f(X) ∪ g(X) )
Base.:∩(f::Function, g::Function) = X -> ( f(X) ∩ g(X) )  # or f(g(X)) for contractors

include("arithmetic.jl")
include("transformations.jl")
include("powers.jl")
include("trig.jl")

end
