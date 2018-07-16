#Test library imports
using Base.Test

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

# Interval box tests
