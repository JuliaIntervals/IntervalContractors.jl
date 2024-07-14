#Test library imports
using Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

#Preamble
setprecision(53)
setprecision(Interval, Float64)

# Using approximate checks for validaty update later?
import Base.isapprox
isapprox(x::Interval,y::Interval) = isapprox(inf(x),inf(y),atol=1E-4) && isapprox(sup(x),sup(y),atol=1E-4)

@testset "sinh_rev_test" begin
    @test isapprox(sinh_rev(∅, -∞..∞)[2], ∅)
    @test isapprox(sinh_rev(interval(-10.0, -1.0), -∞..∞)[2], interval(-2.99823, -0.881373))
    @test isapprox(sinh_rev(interval(0.0, Inf), -∞..∞)[2], interval(0.0, ∞))
    @test isapprox(sinh_rev(interval(0.0, 1.0), -∞..∞)[2], interval(0, 0.881374))
    @test isapprox(sinh_rev(interval(-0.5, 1.0), -∞..∞)[2], interval(-0.481212, 0.881374))
    @test isapprox(sinh_rev(interval(-1000.0, 1.0), -∞..∞)[2], interval(-7.60091, 0.881374))
    @test isapprox(sinh_rev(interval(0.0, 25.0), -∞..∞)[2], interval(0.0, 3.91243))
    @test isapprox(sinh_rev(interval(-1.0, 25.0), -∞..∞)[2], interval(-0.881374, 3.91243))
end

@testset "tanh_rev_test" begin
    @test isequal_interval(tanh_rev(∅, -∞..∞)[2], ∅)
    @test isequal_interval(tanh_rev(interval(-10.0, -1.0), -∞..∞)[2], ∅)
    @test isapprox(tanh_rev(interval(0.0, Inf), -∞..∞)[2], interval(0.0, ∞))
    @test isapprox(tanh_rev(interval(0.0, 1.0), -∞..∞)[2], interval(0.0, ∞))
    @test isapprox(tanh_rev(interval(-0.5, 1.0), -∞..∞)[2], interval(-0.549307, ∞))
    @test isapprox(tanh_rev(interval(-1000.0, 1.0), -∞..∞)[2], interval(-∞, ∞))
    @test isapprox(tanh_rev(interval(0.0, 25.0), -∞..∞)[2], interval(0, ∞))
    @test isapprox(tanh_rev(interval(-1.0, 25.0), -∞..∞)[2], interval(-∞, ∞))
end
