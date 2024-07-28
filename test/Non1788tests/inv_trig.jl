# ADD TEST SET FOR ACOS, ATAN

using Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

@testset "acos_rev_test" begin
    @test eq(acos_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(acos_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(acos_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(acos_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], emptyinterval())
    @test approx_eq(acos_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(0.540302, 0.540303))
    @test eq(acos_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-1.0, 1.0))
    @test eq(acos_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(1.0, 1.0))
end

@testset "atan_rev_test" begin
    @test eq(atan_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(atan_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(atan_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test approx_eq(atan_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(1.5574, 1.55741))
    @test eq(atan_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(atan_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(-Inf, Inf))
end
