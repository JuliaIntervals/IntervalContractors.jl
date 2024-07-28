#Test library imports
using Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

@testset "asinh_rev_test" begin
    @test eq(asinh_rev(emptyinterval(), entireinterval())[2], emptyinterval())
    @test approx_eq(asinh_rev(interval(0.0, Inf), entireinterval())[2], interval(0.0, Inf))
    @test approx_eq(asinh_rev(interval(0.0, 1.0), entireinterval())[2], interval(0, 1.17521))
    @test approx_eq(asinh_rev(interval(-0.5, 1.0), entireinterval())[2], interval(-0.521096, 1.17521))
    @test approx_eq(asinh_rev(interval(-1000.0, 1.0), entireinterval())[2], interval(-Inf, 1.17521))
end

@testset "acosh_rev_test" begin
    @test eq(acosh_rev(emptyinterval(), entireinterval())[2], emptyinterval())
    @test eq(acosh_rev(interval(0.0, Inf), entireinterval())[2], interval(1.0, Inf))
    @test approx_eq(acosh_rev(interval(0.0, 1.0), entireinterval())[2], interval(1.0, 1.54309))
    @test approx_eq(acosh_rev(interval(-0.5, 1.0), entireinterval())[2], interval(1.0, 1.54309))
    @test eq(acosh_rev(interval(-1000.0, 1.0), entireinterval())[2], interval(1.0, Inf))
end

@testset "atanh_rev_test" begin
    @test eq(atanh_rev(emptyinterval(), entireinterval())[2], emptyinterval())
    @test approx_eq(atanh_rev(interval(-10.0, -1.0), entireinterval())[2], interval(-1, -0.761594))
    @test eq(atanh_rev(interval(0.0, Inf), entireinterval())[2], interval(0, 1))
    @test approx_eq(atanh_rev(interval(0.0, 1.0), entireinterval())[2], interval(0, 0.761595))
    @test approx_eq(atanh_rev(interval(-0.5, 1.0), entireinterval())[2], interval(-0.462118, 0.761595))
    @test approx_eq(atanh_rev(interval(-1000.0, 1.0), entireinterval())[2], interval(-1, 0.761595))
    @test eq(atanh_rev(interval(0.0, 25.0), entireinterval())[2], interval(0, 1))
    @test approx_eq(atanh_rev(interval(-1.0, 25.0), entireinterval())[2], interval(-0.761595, 1))
end
