__precompile__(true)

module IntervalContractors

export plus_rev, minus_rev,
        mul_rev,
        power_rev,
        sqr_rev,
        sqrt_rev,
        sin_rev


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



"""
Dictionary mapping functions to their reverse functions.
"""
const rev_ops = Dict(
                    :+     => :plus_rev,
                    :-     => :minus_rev,
                    :*     => :mul_rev,
                    :^     => :power_rev,
                    :sqrt  => :sqrt_rev,
                    :sqr   => :sqr_rev,
                    :sin   => :sin_rev,
                    :()    => :()   # empty operation
                    )


end
