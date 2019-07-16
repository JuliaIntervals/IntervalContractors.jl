using IntervalContractors
using IntervalArithmetic
using Test

@testset "IntervalContractors tests" begin
    include("abs_rev.jl")
    include("libieeep1788_rev.jl")
    include("Non1788tests.jl")

    @testset "power_rev for odd power" begin
        x = -∞..∞
        a = -8..27
        power_rev(a, x, 3)[2] == Interval(-2.0000000000000004, 3.0000000000000004)
    end

    @testset "mul_rev with sets straddling 0" begin
        x = -1..5
        y = -1..1
        z = 2..10

        @test mul_rev(z, x, y) == (2..10, 2..5, 0.4..1.0)
    end
end
