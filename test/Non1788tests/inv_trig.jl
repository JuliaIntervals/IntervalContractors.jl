# ADD TEST SET FOR ACOS, ATAN

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

@testset "acos_rev_test" begin
    @test acos_rev(∅, entireinterval(Float64))[2] == ∅
    @test acos_rev(interval(0.0, 1.0), ∅)[2] == ∅
    @test acos_rev(∅, interval(0.0, 1.0))[2] == ∅
    @test acos_rev(interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test isapprox(acos_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(0.540302, 0.540303))
    @test acos_rev(entireinterval(Float64), entireinterval(Float64))[2] == interval(-1.0, 1.0)
    @test acos_rev(interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(1.0, 1.0)
end

@testset "atan_rev_test" begin
    @test atan_rev(∅, entireinterval(Float64))[2] == ∅
    @test atan_rev(interval(0.0, 1.0), ∅)[2] == ∅
    @test atan_rev(∅, interval(0.0, 1.0))[2] == ∅
    @test isapprox(atan_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(1.5574, 1.55741))
    @test atan_rev(entireinterval(Float64), entireinterval(Float64))[2] == interval(-∞, ∞)
    @test atan_rev(interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(-∞, ∞)
end
