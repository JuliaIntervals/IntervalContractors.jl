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

@testset "max_rev_test" begin
    @test max_rev(∅, entireinterval(Float64),entireinterval(Float64))[2] == Interval(-∞, ∞)
    @test max_rev(Interval(0.0, 1.0), ∅,Interval(-2.0, -1.0))[2] == ∅
    @test max_rev(∅, Interval(0.0, 1.0),Interval(-2.0, -1.0))[2] == ∅
    @test max_rev(Interval(-2.0, -1.0), entireinterval(Float64),Interval(-3.0, -2.0))[2] == Interval(-∞, -1.0)
    @test isapprox(max_rev(Interval(1.0, 1.0), entireinterval(Float64),Interval(-2.0, -1.0))[2], Interval(-∞, 1))
    @test max_rev(entireinterval(Float64), Interval(-2.0, -1.0), Interval(-3.0, -2.0))[2] == Interval(-2.0, -1.0)
    @test max_rev(Interval(-Inf, 0.0), entireinterval(Float64),Interval(-3.0, -2.0))[2] == Interval(-∞, 0.0)
end

@testset "min_rev_test" begin
    @test min_rev(∅, entireinterval(Float64),entireinterval(Float64))[2] == Interval(-∞, ∞)
    @test min_rev(Interval(0.0, 1.0), ∅,Interval(-2.0, -1.0))[2] == ∅                             # should return empty?
    @test min_rev(∅, Interval(0.0, 1.0),Interval(-2.0, -1.0))[2] == ∅
    @test min_rev(Interval(-2.0, -1.0), entireinterval(Float64),Interval(-3.0, -2.0))[2] == Interval(-∞, -2.0)
    @test isapprox(min_rev(Interval(1.0, 1.0), entireinterval(Float64),Interval(-2.0, -1.0))[2], Interval(-∞, -1.0))
    @test min_rev(entireinterval(Float64), Interval(-2.0, -1.0), Interval(-3.0, -2.0))[2] == Interval(-3.0, -2.0)
    @test min_rev(Interval(-Inf, 0.0), entireinterval(Float64),Interval(-3.0, -2.0))[2] == Interval(-∞, -2.0)
end
