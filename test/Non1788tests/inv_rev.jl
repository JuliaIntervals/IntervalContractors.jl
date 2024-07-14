# ADD TESTS SET FOR INVERSE
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

@testset "inv_rev_test" begin
    @test isequal_interval(inv_rev(∅, entireinterval(Float64))[2], ∅)
    @test isequal_interval(inv_rev(interval(0.0, 1.0), ∅)[2], ∅)
    @test isequal_interval(inv_rev(∅, interval(0.0, 1.0))[2], ∅)
    @test isequal_interval(inv_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], Interval(-1.0, -0.5))
    @test isequal_interval(inv_rev(interval(1.0, 1.0), entireinterval(Float64))[2], Interval(1.0, 1.0))
    @test isequal_interval(inv_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-∞, ∞))
    @test isequal_interval(inv_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], Interval(-∞, 0.0))
end
