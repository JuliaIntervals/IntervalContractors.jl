module IntervalContractors

export plus_rev, minus_rev, inv_rev,
       mul_rev, div_rev, power_rev,
       sign_rev, max_rev, min_rev,
        sqr_rev, sqrt_rev, abs_rev,
        exp_rev, exp2_rev, exp10_rev, expm1_rev,
        log_rev, log2_rev, log10_rev, log1p_rev,
        sin_rev, cos_rev, tan_rev,
        asin_rev, acos_rev, atan_rev,
        sinh_rev, cosh_rev, tanh_rev,
        asinh_rev, acosh_rev, atanh_rev,
        mul_rev_IEEE1788, mul_rev_to_pair,
        pow_rev1, pow_rev2

using IntervalArithmetic, IntervalArithmetic.Symbols
using IntervalBoxes

const IntervalType{T} = Union{Interval{T}, BareInterval{T}}

# @generated
# half_pi(::Type{T}) where {T <: IntervalType} = :(exact(0.5) * convert($T, exact(pi)))
# @generated
# two_pi(::Type{T}) where {T <: IntervalType} = :(exact(2.0) * convert($T, exact(pi)))

@generated function half_pi(x::T) where {T <: IntervalType}
    return exact(0.5) * convert(T, exact(pi))
end

@generated function two_pi(x::T) where {T <: IntervalType}
    return exact(2.0) * convert(T, exact(pi))
end

@generated function pi_interval(x::T) where {T <: IntervalType}
    return convert(T, exact(pi))
end


include("arithmetic.jl")
include("transformations.jl")
include("powers.jl")
include("exponential.jl")
include("trig.jl")
include("inverse_trig.jl")
include("hyperbolic.jl")
include("inverse_hyperbolic.jl")
include("extrema.jl")

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
            :exp, :exp2, :exp10, :expm1,
            :log, :log2, :log10, :log1p,
            :sin, :cos, :tan,
            :asin, :acos, :atan,
            :sinh, :cosh, :tanh,
            :asinh, :acosh, :atanh,
            :inv, :sign, :max, :min)
    reverse_operations[f] = Symbol(f, "_rev")
end

end
