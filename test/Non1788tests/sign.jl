using Test

using IntervalArithmetic
using IntervalContractors

@testset "sign_rev_test" begin
    @test eq(sign_rev(emptyinterval(), entireinterval(Float64))[2], emptyinterval())
    @test eq(sign_rev(interval(0.0, 1.0), emptyinterval())[2], emptyinterval())
    @test eq(sign_rev(interval(2.0, 3.0), entireinterval(Float64))[2], emptyinterval())

    @test eq(sign_rev(interval(1.0, 1.0),  entireinterval(Float64))[2], interval(0.0, Inf))
    @test eq(sign_rev(interval(-1.0, -1.0), entireinterval(Float64))[2], interval(-Inf, 0.0))
    @test eq(sign_rev(interval(0.0, 0.0),  entireinterval(Float64))[2], interval(0.0, 0.0))

    @test eq(sign_rev(interval(0.0, 1.0),  entireinterval(Float64))[2], interval(0.0, Inf))
    @test eq(sign_rev(interval(-1.0, 0.0), entireinterval(Float64))[2], interval(-Inf, 0.0))
    @test eq(sign_rev(interval(-1.0, 1.0), entireinterval(Float64))[2], entireinterval(Float64))

    @test eq(sign_rev(interval(1.0, 1.0), interval(-5.0, 5.0))[2], interval(0.0, 5.0))
    @test eq(sign_rev(interval(-1.0, -1.0), interval(-5.0, 5.0))[2], interval(-5.0, 0.0))
end
