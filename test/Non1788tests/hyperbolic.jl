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
isapprox(x::Interval,y::Interval) = isapprox(x.lo,y.lo,atol=1E-4) && isapprox(x.hi,y.hi,atol=1E-4)

@testset "sinh_rev_test" begin
    @test isapprox(sinh_rev(∅, -∞..∞)[2], ∅)
    @test isapprox(sinh_rev(Interval(-10.0, -1.0), -∞..∞)[2], Interval(-2.99823, -0.881373))
    @test isapprox(sinh_rev(Interval(0.0, Inf), -∞..∞)[2], Interval(0.0, ∞))
    @test isapprox(sinh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(0, 0.881374))
    @test isapprox(sinh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(-0.481212, 0.881374))
    @test isapprox(sinh_rev(Interval(-1000.0, 1.0), -∞..∞)[2], Interval(-7.60091, 0.881374))
    @test isapprox(sinh_rev(Interval(0.0, 25.0), -∞..∞)[2], Interval(0.0, 3.91243))
    @test isapprox(sinh_rev(Interval(-1.0, 25.0), -∞..∞)[2], Interval(-0.881374, 3.91243))
end

@testset "cosh_rev_test" begin
    @test isapprox(cosh_rev(∅, -∞..∞)[2], ∅)
    @test isapprox(cosh_rev(Interval(-10.0, -1.0), -∞..∞)[2], ∅)
    @test isapprox(cosh_rev(Interval(0.0, Inf), -∞..∞)[2], Interval(0.0, ∞))
    @test isapprox(cosh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(0, 0))
    @test isapprox(cosh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(0, 0))
    @test isapprox(cosh_rev(Interval(-1000.0, 1.0), -∞..∞)[2], Interval(0, 0))
    @test isapprox(cosh_rev(Interval(0.0, 25.0), -∞..∞)[2], Interval(0, 3.91163))
    @test isapprox(cosh_rev(Interval(-1.0, 25.0), -∞..∞)[2], Interval(0, 3.91163))
end

@testset "tanh_rev_test" begin
    @test tanh_rev(∅, -∞..∞)[2] == ∅
    @test tanh_rev(Interval(-10.0, -1.0), -∞..∞)[2] == ∅
    @test isapprox(tanh_rev(Interval(0.0, Inf), -∞..∞)[2], Interval(0.0, ∞))
    @test isapprox(tanh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(0.0, ∞))
    @test isapprox(tanh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(-0.549307, ∞))
    @test isapprox(tanh_rev(Interval(-1000.0, 1.0), -∞..∞)[2], Interval(-∞, ∞))
    @test isapprox(tanh_rev(Interval(0.0, 25.0), -∞..∞)[2], Interval(0, ∞))
    @test isapprox(tanh_rev(Interval(-1.0, 25.0), -∞..∞)[2], Interval(-∞, ∞))
end
