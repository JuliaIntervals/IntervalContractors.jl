# ADD TESTS SET FOR INVERSE
#Test library imports
using Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

@testset "inv_rev_test" begin
    @test eq(inv_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(inv_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(inv_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(inv_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], interval(-1.0, -0.5))
    @test eq(inv_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(1.0, 1.0))
    @test eq(inv_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(inv_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(-Inf, 0.0))
end
