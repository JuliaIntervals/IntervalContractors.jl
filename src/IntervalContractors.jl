module IntervalContractors

export plus_rev, minus_rev,
       mul_rev, div_rev, power_rev,
        sqr_rev, sqrt_rev, abs_rev,
        exp_rev, exp2_rev, exp10_rev,
        log_rev, log2_rev, log10_rev,
        sin_rev, cos_rev, tan_rev,
        asin_rev, acos_rev, atan_rev,
        sinh_rev, cosh_rev, tanh_rev,
        asinh_rev, acosh_rev, atanh_rev,
        mul_rev_IEEE1788

using IntervalArithmetic

const half_pi = IntervalArithmetic.half_pi(Float64)  # interval
const two_pi = IntervalArithmetic.two_pi(Float64)  # interval

#
# Base.:∪(f::Function, g::Function) = X -> ( f(X) ∪ g(X) )
# Base.:∩(f::Function, g::Function) = X -> ( f(X) ∩ g(X) )  # or f(g(X)) for contractors

include("arithmetic.jl")
include("transformations.jl")
include("powers.jl")
include("exponential.jl")
include("trig.jl")
include("inverse_trig.jl")
include("hyperbolic.jl")
include("inverse_hyperbolic.jl")

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

for f in (  :sqrt, :sqr, :abs,
            :exp, :exp2, :exp10,
            :log, :log2, :log10,
            :sin, :cos, :tan,
            :asin, :acos, :atan,
            :sinh, :cosh, :tanh,
            :asinh, :acosh, :atanh)
    reverse_operations[f] = Symbol(f, "_rev")
end

end


#=
# CHECKLIST FOR ADDING NEW FUNCTIONS
    - Initial commit:
        - exp_rev operators,
        - intervalbox operators,
        - add export,
        - add to reverse_operations
    - ADD testing after initial commit Testing?
    - Style guide for doc strings? Right now I'm just guessing at this...

TO DO LIST:
(X,X,X,X), () exp2,
(X,X,X,X), () exp10,
(X,X,X,X), () log2,
(X,X,X,X), () log10,
(X,X,X,X), (X) sinh,
(X,X,X,X), (X) cosh,
(X,X,X,X), () tanh,
(X,X,X,X), () asinh,
(X,X,X,X), () acosh,
(X,X,X,X), () atanh
(X,X,X,X), () acos,
(X,X,X,X), () atan,

(,,,), () min,
(,,,), () max
(,,,), () inv,

erf
erfc
erfinv
erfcinv
abs2
atan2,

sec,
csc,
cot,
asec,
acsc,
acot,

csch,
sech,
coth,
csch,
sech,
coth

Scaled function versions available in DiffRules
=#
