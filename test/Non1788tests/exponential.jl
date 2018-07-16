#Test library imports
using Base.Test

#Arithmetic library imports
using IntervalArithmetic
using IntervalContractors

#Preamble
setprecision(53)
setprecision(Interval, Float64)

# Using approximate checks for validaty update later?
import Base.isapprox
isapprox(x::Interval,y::Interval) = isapprox(x.lo,y.lo,atol=1E-4) && isapprox(x.hi,y.hi,atol=1E-4)

@testset "exp2_rev_test" begin
    @test exp2_rev(∅, entireinterval(Float64))[2] == ∅
    @test exp2_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test exp2_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test exp2_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test exp2_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test exp2_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test exp2_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "exp10_rev_test" begin
    @test exp10_rev(∅, entireinterval(Float64))[2] == ∅
    @test exp10_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test exp10_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test exp10_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test exp10_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test exp10_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test exp10_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "expm1_rev_test" begin
    @test expm1_rev(∅, entireinterval(Float64))[2] == ∅
    @test expm1_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test expm1_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test expm1_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test expm1_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test expm1_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test expm1_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "log2_rev_test" begin
    @test log2_rev(∅, entireinterval(Float64))[2] == ∅
    @test log2_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test log2_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test log2_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test log2_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test log2_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test log2_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "log10_rev_test" begin
    @test log10_rev(∅, entireinterval(Float64))[2] == ∅
    @test log10_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test log10_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test log10_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test log10_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test log10_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test log10_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "log1p_rev_test" begin
    @test log1p_rev(∅, entireinterval(Float64))[2] == ∅
    @test log1p_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test log1p_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test log1p_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test log1p_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test log1p_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test log1p_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end


# Interval box tests
