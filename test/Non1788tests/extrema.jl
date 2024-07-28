using Test

# Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

@testset "max_rev_test" begin
    @test eq(max_rev(emptyinterval(), entireinterval(Float64),entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(max_rev(interval(0.0, 1.0), emptyinterval(),interval(-2.0, -1.0))[2], emptyinterval())
    @test eq(max_rev(emptyinterval(), interval(0.0, 1.0),interval(-2.0, -1.0))[2], emptyinterval())
    @test eq(max_rev(interval(-2.0, -1.0), entireinterval(Float64),interval(-3.0, -2.0))[2], interval(-Inf, -1.0))
    @test approx_eq(max_rev(interval(1.0, 1.0), entireinterval(Float64),interval(-2.0, -1.0))[2], interval(-Inf, 1))
    @test eq(max_rev(entireinterval(Float64), interval(-2.0, -1.0), interval(-3.0, -2.0))[2], interval(-2.0, -1.0))
    @test eq(max_rev(interval(-Inf, 0.0), entireinterval(Float64),interval(-3.0, -2.0))[2], interval(-Inf, 0.0))
end

@testset "min_rev_test" begin
    @test eq(min_rev(emptyinterval(), entireinterval(Float64),entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(min_rev(interval(0.0, 1.0), emptyinterval(), interval(-2.0, -1.0))[2], emptyinterval())                             # should return empty?)
    @test eq(min_rev(emptyinterval(), interval(0.0, 1.0),interval(-2.0, -1.0))[2], emptyinterval())
    @test eq(min_rev(interval(-2.0, -1.0), entireinterval(Float64),interval(-3.0, -2.0))[2], interval(-Inf, -2.0))
    @test approx_eq(min_rev(interval(1.0, 1.0), entireinterval(Float64),interval(-2.0, -1.0))[2], interval(-Inf, -1.0))
    @test eq(min_rev(entireinterval(Float64), interval(-2.0, -1.0), interval(-3.0, -2.0))[2], interval(-3.0, -2.0))
    @test eq(min_rev(interval(-Inf, 0.0), entireinterval(Float64),interval(-3.0, -2.0))[2], interval(-Inf, -2.0))
end
