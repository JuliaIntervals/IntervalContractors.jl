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

@testset "exp2_rev_test" begin
    @test isequal_interval(exp2_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(exp2_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(exp2_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isequal_interval(exp2_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], ∅)
    @test isequal_interval(exp2_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(0.0, 0.0))
    @test isequal_interval(exp2_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-∞, ∞))
    @test isequal_interval(exp2_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], ∅)
end

@testset "exp10_rev_test" begin
    @test isequal_interval(exp10_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(exp10_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(exp10_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isequal_interval(exp10_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], ∅)
    @test isequal_interval(exp10_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(0.0, 0.0))
    @test isequal_interval(exp10_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-∞, ∞))
    @test isequal_interval(exp10_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], ∅)
end

@testset "expm1_rev_test" begin
    @test isequal_interval(expm1_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(expm1_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(expm1_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isequal_interval(expm1_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], ∅)
    @test isapprox(expm1_rev(interval(1.0, 1.0), entireinterval(Float64))[2],Interval(0.693147, 0.693148))
    @test isequal_interval(expm1_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-∞, ∞))
    @test isequal_interval(expm1_rev(interval(-Inf, -1.0), entireinterval(Float64))[2], ∅)
end

@testset "log2_rev_test" begin
    @test isequal_interval(log2_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(log2_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(log2_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isequal_interval(log2_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], Interval(0.25, 0.5))
    @test isequal_interval(log2_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(2.0, 2.0))
    @test isequal_interval(log2_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(0.0, Inf))
    @test isequal_interval(log2_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], Interval(0.0, 1.0))
end

@testset "log10_rev_test" begin
    @test isequal_interval(log10_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(log10_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(log10_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isapprox(log10_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], Interval(0.00999999, 0.100001))
    @test isequal_interval(log10_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(10.0, 10.0))
    @test isequal_interval(log10_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(0.0, Inf))
    @test isequal_interval(log10_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], Interval(0.0, 1.0))
end

@testset "log1p_rev_test" begin
    @test isequal_interval(log1p_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(log1p_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(log1p_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isapprox(log1p_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], Interval(-0.864665, -0.63212))
    @test isapprox(log1p_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(1.71828, 1.71829))
    @test isequal_interval(log1p_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-1.0, Inf))
    @test isequal_interval(log1p_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], Interval(-1.0, 0.0))
end
