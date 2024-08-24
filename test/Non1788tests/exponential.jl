using Test

using IntervalArithmetic
using IntervalContractors

# Using approximate checks for validity update later?

@testset "exp2_rev_test" begin
    @test eq(exp2_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(exp2_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(exp2_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(exp2_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], emptyinterval())
    @test eq(exp2_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(0.0, 0.0))
    @test eq(exp2_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(exp2_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], emptyinterval())
end

@testset "exp10_rev_test" begin
    @test eq(exp10_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(exp10_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(exp10_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(exp10_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], emptyinterval())
    @test eq(exp10_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(0.0, 0.0))
    @test eq(exp10_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(exp10_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], emptyinterval())
end

@testset "expm1_rev_test" begin
    @test eq(expm1_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(expm1_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(expm1_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(expm1_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], emptyinterval())
    @test approx_eq(expm1_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(0.693147, 0.693148))
    @test eq(expm1_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-Inf, Inf))
    @test eq(expm1_rev(interval(-Inf, -1.0), entireinterval(Float64))[2], emptyinterval())
end

@testset "log2_rev_test" begin
    @test eq(log2_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(log2_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(log2_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test eq(log2_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], interval(0.25, 0.5))
    @test eq(log2_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(2.0, 2.0))
    @test eq(log2_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(0.0, Inf))
    @test eq(log2_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(0.0, 1.0))
end

@testset "log10_rev_test" begin
    @test eq(log10_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(log10_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(log10_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test approx_eq(log10_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], interval(0.00999999, 0.100001))
    @test eq(log10_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(10.0, 10.0))
    @test eq(log10_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(0.0, Inf))
    @test eq(log10_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(0.0, 1.0))
end

@testset "log1p_rev_test" begin
    @test eq(log1p_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(log1p_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(log1p_rev(emptyinterval(), interval(0.0, 1.0))[2], emptyinterval())
    @test approx_eq(log1p_rev(interval(-2.0, -1.0), entireinterval(Float64))[2], interval(-0.864665, -0.63212))
    @test approx_eq(log1p_rev(interval(1.0, 1.0), entireinterval(Float64))[2], interval(1.71828, 1.71829))
    @test eq(log1p_rev(entireinterval(Float64), entireinterval(Float64))[2], interval(-1.0, Inf))
    @test eq(log1p_rev(interval(-Inf, 0.0), entireinterval(Float64))[2], interval(-1.0, 0.0))
end
