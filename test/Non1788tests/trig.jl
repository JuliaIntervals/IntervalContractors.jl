# ADD TEST SET FOR ACOS, ATAN

@testset "acos_rev_test" begin
    @test acos_rev(∅, entireinterval(Float64))[2] == ∅
    @test acos_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test acos_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test acos_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test acos_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test acos_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test acos_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

@testset "atan_rev_test" begin
    @test atan_rev(∅, entireinterval(Float64))[2] == ∅
    @test atan_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test atan_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test atan_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test atan_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test atan_rev(entireinterval(Float64), entireinterval(Float64))[2] == Interval(0.0, Inf)
    @test atan_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
end

# interval box tests
