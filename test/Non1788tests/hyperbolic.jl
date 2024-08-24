#Test library imports
using Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

@testset "sinh_rev_test" begin
    @test approx_eq(sinh_rev(emptyinterval(), entireinterval())[2], emptyinterval())
    @test approx_eq(sinh_rev(interval(-10.0, -1.0), entireinterval())[2], interval(-2.99823, -0.881373))
    @test approx_eq(sinh_rev(interval(0.0, Inf), entireinterval())[2], interval(0.0, Inf))
    @test approx_eq(sinh_rev(interval(0.0, 1.0), entireinterval())[2], interval(0, 0.881374))
    @test approx_eq(sinh_rev(interval(-0.5, 1.0), entireinterval())[2], interval(-0.481212, 0.881374))
    @test approx_eq(sinh_rev(interval(-1000.0, 1.0), entireinterval())[2], interval(-7.60091, 0.881374))
    @test approx_eq(sinh_rev(interval(0.0, 25.0), entireinterval())[2], interval(0.0, 3.91243))
    @test approx_eq(sinh_rev(interval(-1.0, 25.0), entireinterval())[2], interval(-0.881374, 3.91243))
end

@testset "tanh_rev_test" begin
    @test eq(tanh_rev(emptyinterval(), entireinterval())[2], emptyinterval())
    @test eq(tanh_rev(interval(-10.0, -1.0), entireinterval())[2], emptyinterval())
    @test approx_eq(tanh_rev(interval(0.0, Inf), entireinterval())[2], interval(0.0, Inf))
    @test approx_eq(tanh_rev(interval(0.0, 1.0), entireinterval())[2], interval(0.0, Inf))
    @test approx_eq(tanh_rev(interval(-0.5, 1.0), entireinterval())[2], interval(-0.549307, Inf))
    @test approx_eq(tanh_rev(interval(-1000.0, 1.0), entireinterval())[2], interval(-Inf, Inf))
    @test approx_eq(tanh_rev(interval(0.0, 25.0), entireinterval())[2], interval(0, Inf))
    @test approx_eq(tanh_rev(interval(-1.0, 25.0), entireinterval())[2], interval(-Inf, Inf))
end
