__precompile__(true)

module IntervalContractors

export plus_rev, minus_rev,
        mul_rev, div_rev,
        power_rev,
        sqr_rev,
        sqrt_rev,
        sin_rev, cos_rev, tan_rev
        asin_rev

using IntervalArithmetic
using Compat

const half_pi = IntervalArithmetic.half_pi(Float64)  # interval
const two_pi = IntervalArithmetic.two_pi(Float64)  # interval


Base.:∪(f::Function, g::Function) = X -> ( f(X) ∪ g(X) )
Base.:∩(f::Function, g::Function) = X -> ( f(X) ∩ g(X) )  # or f(g(X)) for contractors

include("arithmetic.jl")
include("transformations.jl")
include("powers.jl")
include("trig.jl")
include("inverse_trig.jl")


"""
Dictionary mapping functions to their reverse functions.
"""
const reverse_operations = Dict(
                    :+     => :plus_rev,
                    :-     => :minus_rev,
                    :*     => :mul_rev,
                    :/     => :div_rev,
                    :^     => :power_rev,
                    :()    => :()   # empty operation
                    )

for f in (  :sqrt, :sqr,
            :sin, :cos, :tan,
            :asin)
    reverse_operations[f] = Symbol(f, "_rev")
end

end
