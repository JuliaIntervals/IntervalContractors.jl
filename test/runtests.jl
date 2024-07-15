using IntervalContractors
using IntervalArithmetic
using Test

eq(a, b) = isequal_interval(bareinterval(a), bareinterval(b))

@testset "IntervalContractors tests" begin
    include("abs_rev.jl")
    include("libieeep1788_rev.jl")
    include("libieeep1788_mul_rev.jl")
    include("pow_rev.jl")
    include("Non1788tests.jl")

    @testset "power_rev for odd power" begin
        x = -∞..∞
        a = -8..27
        @test eq(power_rev(a, x, 3)[2], interval(-2.0000000000000004, 3.0000000000000004))
    end

    @testset "mul_rev with sets straddling 0" begin
        x = -1..5
        y = -1..1
        z = 2..10

        @test isequal_interval.(mul_rev(z, x, y), (2..10, 2..5, 0.4..1.0))
    end

    @testset "Exponents with integer values but not types" begin
        @test isequal_interval.(power_rev(-Inf..Inf, -4..4, 2.0),  (-∞..∞, -4..4, 2.0))
    end
end
