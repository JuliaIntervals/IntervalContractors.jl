using IntervalContractors
using IntervalArithmetic
using Base.Test

include("abs_rev.jl")
include("libieeep1788_rev.jl")

include("Non1788tests/inv_hyperbolic.jl")
include("Non1788tests/hyperbolic.jl")
include("Non1788tests/extrema.jl")
include("Non1788tests/exponential.jl")
include("Non1788tests/inv_rev.jl")
include("Non1788tests/inv_trig.jl")

@testset "power_rev for odd power" begin
    x = -∞..∞
    a = -8..27
    power_rev(a, x, 3)[2] == Interval(-2.0000000000000004, 3.0000000000000004)
end
