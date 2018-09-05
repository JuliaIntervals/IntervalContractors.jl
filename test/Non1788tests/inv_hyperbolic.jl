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

@testset "asinh_rev_test" begin
    @test asinh_rev(∅, -∞..∞)[2] == ∅
    @test isapprox(asinh_rev(Interval(0.0, Inf), -∞..∞)[2], Interval(0.0, ∞))
    @test isapprox(asinh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(0, 1.17521))
    @test isapprox(asinh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(-0.521096, 1.17521))
    @test isapprox(asinh_rev(Interval(-1000.0, 1.0), -∞..∞)[2], Interval(-∞, 1.17521))
end

@testset "acosh_rev_test" begin
    @test acosh_rev(∅, -∞..∞)[2] == ∅
    @test acosh_rev(Interval(0.0, Inf), -∞..∞)[2] == Interval(1.0, ∞)
    @test isapprox(acosh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(1.0, 1.54309))
    @test isapprox(acosh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(1.0, 1.54309))
    @test acosh_rev(Interval(-1000.0, 1.0), -∞..∞)[2] == Interval(1.0, ∞)
end

@testset "atanh_rev_test" begin
    @test atanh_rev(∅, -∞..∞)[2] == ∅
    @test isapprox(atanh_rev(Interval(-10.0, -1.0), -∞..∞)[2], Interval(-1, -0.761594))
    @test atanh_rev(Interval(0.0, Inf), -∞..∞)[2] == Interval(0, 1)
    @test isapprox(atanh_rev(Interval(0.0, 1.0), -∞..∞)[2], Interval(0, 0.761595))
    @test isapprox(atanh_rev(Interval(-0.5, 1.0), -∞..∞)[2], Interval(-0.462118, 0.761595))
    @test isapprox(atanh_rev(Interval(-1000.0, 1.0), -∞..∞)[2], Interval(-1, 0.761595))
    @test atanh_rev(Interval(0.0, 25.0), -∞..∞)[2] == Interval(0, 1)
    @test isapprox(atanh_rev(Interval(-1.0, 25.0), -∞..∞)[2], Interval(-0.761595, 1))
end
