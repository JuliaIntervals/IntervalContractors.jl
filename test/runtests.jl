using IntervalContractors
using IntervalArithmetic
using Test

using IntervalContractors: IntervalType

# cache current power mode:
orig_power_mode = IntervalArithmetic.power_mode()

# set power mode to "slow" (using MPFR for correct rounding):
IntervalArithmetic.power_mode() = IntervalArithmetic.PowerMode{:slow}()

eq(a::IntervalType, b::IntervalType) = isequal_interval(bareinterval(a), bareinterval(b))

eq(a::Tuple, b::Tuple) = all(eq.(a, b))

approx_eq(x::IntervalType, y::IntervalType) =
    isapprox(inf(x), inf(y), atol=1e-4) && isapprox(sup(x), sup(y), atol=1e-4)

@testset "IntervalContractors tests" begin
    include("abs_rev.jl")
    include("libieeep1788_rev.jl")
    include("libieeep1788_mul_rev.jl")
    include("pow_rev.jl")
    include("Non1788tests.jl")

    @testset "power_rev for odd power" begin
        x = entireinterval()
        a = interval(-8, 27)
        @test eq(power_rev(a, x, 3)[2], interval(-2, 3))
    end

    @testset "mul_rev with sets straddling 0" begin
        x = interval(-1, 5)
        y = interval(-1, 1)
        z = interval(2, 10)

        @test all(eq.(mul_rev(z, x, y), (interval(2, 10), interval(2, 5), interval(0.39999999999999997, 1))))
    end

    @testset "Exponents with integer values but not types" begin
        @test eq(power_rev(entireinterval(), interval(-4, 4), interval(2.0)),
                (entireinterval(), interval(-4, 4), interval(2.0)))
    end
end

@testset "Bare intervals" begin
    x = bareinterval(0, 1)
    y = bareinterval(0, 2)
    z = bareinterval(0, 3)

    @test eq(plus_rev(x, y, z),
        (bareinterval(0, 1), bareinterval(0, 1), bareinterval(0, 1)))

    @test eq(sin_rev(bareinterval(0, 1), bareinterval(3, 4)),
        (bareinterval(0, 1), bareinterval(3, 3.1415926535897936)))
end

# reset power mode:
IntervalArithmetic.power_mode() = orig_power_mode
